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
  ingredients = [ 
    'pepper',
    'oil',
    'onion',
    'chilli',
    'beef',
    'tomato',
    'tomato sauce',
    'beans',
    'rice',
    'yoghourt',
    'chicken',
    'chorizo',
    'cream',
    'carrot',
    'raisins',
    'orange',
    'juice',
    'banana',
    'lentils',
    'milk',
    'jam',
    'potato',
    'parsnip',
    'bread',
    'chickpeas',
    'pork',
    'pesto',
    'sweet potato',
    'wine',
    'cheese',
    'cheddar',
    'naan',
    'falafel',
    'pitta',
    'baguette',
    'bacon',
    'mozzarella',
    'gruyère',
    'mustard',
    'raspberry',
    'noodle',
    'corn',
    'mushroom',
    'soy sauce',
    'ginger',
    'lasagne sheets',
    'pasta',
    'courgette',
    'ricotta',
    'celery',
    'parmesan',
    'spaghetti',
    'coconut milk',
    'peas',
    'butternut'
  ]

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


def scrape_bbc_good_food
  recipes = []
  20.times do |index|
    # get results from search page
    html_file = open("https://www.bbcgoodfood.com/search/video/feed/rss2?page=#{index + 1}").read
    nokogiri_file_search_results = Nokogiri::HTML(html_file)
    # sleep rand(1..4)

    # get array of urls for each recipe
    recipe_urls = nokogiri_file_search_results.search('.teaser-item__title a').map do |recipe|
      recipe.attribute('href').value
    end

    # open each page
    recipe_urls.each do |url|
      file_url = "https://www.bbcgoodfood.com/#{url}"
      html_file = open(file_url).read
      nokogiri_file = Nokogiri::HTML(html_file)

      # generate recipe hash from scraped info
      scraped_recipe = {
        name: nokogiri_file.search('h1').text.strip,
        url_image: nokogiri_file.search('.ratio-11-10 img')[0].attributes['src'].value,
        description: nokogiri_file.search('.method__item p').map { |element| element.text.strip }.join(" "),
        url: file_url,
        ingredients_text: nokogiri_file.search('.ingredients-list__item').map { |element| element.text.strip }.join(" ")
      }
      puts "--recipe for #{url} created"
      recipes << scraped_recipe

      # add recipe to array of recipes
    end
    puts "page #{index + 1} searched, #{recipes.count} scraped in total"
  end
  build_recipe_objects(recipes)
end

def build_recipe_objects(recipes_array)

  # recipe objects with no ingredients/doses are created
  recipes_array.each do |recipe|
    # p recipe
    new_recipe = Recipe.new(
      name: recipe[:name], 
      url_image: recipe[:url_image], 
      description: recipe[:description], 
      url: recipe[:url]
    )
    puts "recipe for #{new_recipe.name} added to the database"
    new_recipe.save!

  # create doses
    Ingredient.all.each do |ingredient|
      if recipe[:ingredients_text].include?(ingredient.name)
        new_dose = Dose.new(recipe: new_recipe, ingredient: ingredient)
        new_dose.save!
      end
    end
  end
end



destroy_all_data

generate_ingredients

scrape_bbc_good_food
