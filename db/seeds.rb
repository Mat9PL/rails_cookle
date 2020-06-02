# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Dose.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

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
