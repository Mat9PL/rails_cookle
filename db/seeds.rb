require 'yaml'

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





### import recipes from URLs
# Url.all[0..5000].each { |url| url.import! }

def update_ingredients_and_recipes
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

  ### analyze recipes
  Recipe.all.each { |recipe| recipe.scrape_ingredients! }
end

# update_ingredients_and_recipes


def build_regex(attributes = {name: '', forbidden_prefixes: [], synonyms: []})
# example: attributes = {name: 'cheese', forbidden_prefixes: ["gruyère", "stilton", "mascarpone"], synonyms: ["queso"]}
  forbidden_prefixes = ""
  name = attributes[:name]
  input_synonyms = attributes[:synonyms]
  input_forbidden_prefixes = attributes[:forbidden_prefixes]
  if input_forbidden_prefixes.class == Array
    input_forbidden_prefixes.each { |prefix| forbidden_prefixes += "(?<!#{prefix + " "})" }
  elsif input_forbidden_prefixes.class == String
    forbidden_prefixes = "(?<!#{input_forbidden_prefixes + " "})"
  end
  regex = "(#{forbidden_prefixes}\\b#{name}\\b)|(#{forbidden_prefixes}\\b#{name.pluralize}\\b)"
  if input_synonyms.class == Array
    input_synonyms.each { |synonym| regex += "|(#{forbidden_prefixes}\\b#{synonym}\\b)|(#{forbidden_prefixes}\\b#{synonym.pluralize}\\b)" }
  elsif input_synonyms.class == String
    regex += "|(#{forbidden_prefixes}\\b#{input_synonyms}\\b)|(#{forbidden_prefixes}\\b#{input_synonyms.pluralize}\\b)"
  end
  regex
end

p Regexp.new(build_regex({name: 'cheese', synonyms: 'queso', forbidden_prefixes: 'gruyere'}))
