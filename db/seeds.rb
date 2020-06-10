require 'yaml'
require 'open-uri'
require 'nokogiri'

def generate_fake_recipes # needs revision, doesn't work currently
  50.times do
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

def import_recipes
  ### import recipes from URLs
  Url.all.each { |url| url.unmark_imported! }
  Url.all[0..1000].each { |url| url.import! }
end

def update_ingredients
  ### destroy previous data
  Dose.destroy_all
  puts 'doses destroyed'
  IngredientGroup.destroy_all
  puts 'ingredient_groups destroyed'
  Ingredient.destroy_all
  puts 'ingredients destroyed'

  ### read yaml files to import ingredients and ingredient groups
  ingredients = YAML.load(File.read("db/yaml/ingredients.yml"))
  ingredient_groups = YAML.load(File.read("db/yaml/ingredient_groups.yml"))

  ### generate and group ingredients
  Ingredient.generate_ingredients(ingredients)
  IngredientGroup.generate_ingredient_groups(ingredient_groups)
  IngredientGroup.all.each { |ing_group| ing_group.group_ingredients!(ingredient_groups[ing_group.name]) }
  Ingredient.all.each { |ing| ing.groupify }
end

def update_recipes
    ### analyze recipes
    Recipe.all.each { |recipe| recipe.scrape_ingredients! }
end

Recipe.destroy_all
purs 'recipes destroyed'
update_ingredients
import_recipes
update_recipes