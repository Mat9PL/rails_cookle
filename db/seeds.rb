# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'nokogiri'

def destroy_all_data
  Dose.destroy_all
  Recipe.destroy_all
  Ingredient.destroy_all
end


def generate_fake_data
  ingredients = ['eggplant', 'potato', 'egg', 'pasta', 'onion', 'shrimp 🦐' ]
  ingredients.sort!
  
  ingredients.each do |ingredient|
    ingredient = Ingredient.new(name: ingredient)
    ingredient.save!
  end
  
  20.times do
    name = Faker::Food.dish
    description = Faker::Food.description
    rating = rand(1..5)
  
    
    recipe = Recipe.new(
      name: name,
      description: description,
      rating: rating,
      url_image: "https://ichef.bbci.co.uk/food/ic/food_16x9_448/recipes/babaganoush_78707_16x9.jpg",
      url: "https://www.bbc.co.uk/food/recipes/baba_ganoush_grilled_50988"
      )
      recipe.save!
      
      all_ingredients = Ingredient.all
      rand(2..5).times do
        added_ingredient = all_ingredients.sample
      p Ingredient.all
      p added_ingredient
      p recipe
      dose = Dose.new(ingredient: added_ingredient, recipe: recipe)
        all_ingredients -= [added_ingredient]
      dose.save!
    end
  end
end


def scrape_BBC_good_food(keyword)
  # find results for keyword
  html_file = open("https://www.bbcgoodfood.com/search/recipes?query=#{keyword}").read
  nokogiri_file_search_results = Nokogiri::HTML(html_file)

  # get array of urls for each recipe
  recipe_urls = nokogiri_file_search_results.search('.teaser-item__title a').map do |recipe|
    recipe.attribute('href').value
  end

  # open each page
  nokogiri_files_recipes = recipe_urls.map do |url|
    html_file = open("https://www.bbcgoodfood.com/#{url}").read
    Nokogiri::HTML(html_file)
  end

  recipes = nokogiri_files_recipes.map do |nokogiri_file|
    recipe = {
      name: nokogiri_file.search('h1').text.strip,
      url_image: nokogiri_file.search('.img-container .ratio-11-10 img'),
      description: nokogiri_file.search('.method__item p').map { |element| element.text.strip }.join("\n")
  }
    recipe
  end
  recipes
end

p scrape_BBC_good_food('aubergine')[0]
p scrape_BBC_good_food('aubergine')[1]

