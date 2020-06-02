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

def generate_ingredients
  ingredients = ['eggplant', 'potato', 'egg', 'pasta', 'onion', 'shrimp 🦐' ]
  ingredients.sort!
  
  ingredients.each do |ingredient|
    ingredient = Ingredient.new(name: ingredient)
    ingredient.save!
  end
end


def generate_fake_recipes
  
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


def scrape_bbc_good_food(keyword)
  # find results for keyword
  html_file = open("https://www.bbcgoodfood.com/search/recipes?query=#{keyword}").read
  nokogiri_file_search_results = Nokogiri::HTML(html_file)

  # get array of urls for each recipe
  recipe_urls = nokogiri_file_search_results.search('.teaser-item__title a').map do |recipe|
    recipe.attribute('href').value
  end

  # open each page and it transform into object
  recipes = recipe_urls.map do |url|
    file_url = "https://www.bbcgoodfood.com/#{url}"
    html_file = open(file_url).read
    nokogiri_file = Nokogiri::HTML(html_file)
    recipe = {
      name: nokogiri_file.search('h1').text.strip,
      url_image: nokogiri_file.search('.ratio-11-10 img')[0].attributes['src'].value,
      description: nokogiri_file.search('.method__item p').map { |element| element.text.strip }.join(" "),
      url: file_url,
    }
  end
  recipes
end

destroy_all_data

generate_ingredients

bbc_food_recipes = scrape_bbc_good_food('aubergine')

ingredients_text =""

bbc_food_recipes.each do |recipe|
  new_recipe = Recipe.new(recipe)
  new_recipe.save!

  # below: create doses
  file_url = new_recipe.url
  html_file = open(file_url).read
  nokogiri_file = Nokogiri::HTML(html_file)
  ingredients_text = nokogiri_file.search('.ingredients-list__item').map { |element| element.text.strip }.join(" ")
  if ingredients_text.include?("aubergine")
    new_dose = Dose.new(recipe: new_recipe, ingredient: Ingredient.where(:name === "eggplant")[0])
    new_dose.save!
  end
end
