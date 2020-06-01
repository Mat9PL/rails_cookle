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

ingredients = %w(eggplant potato egg pasta onion)

ingredients.each { |ingredient| Ingredient.new(name: ingredient) }

20.times do
  name = Faker::Food.dish
  description = Faker::Food.description
  rating = rand(1..5)

  all_ingredients = Ingredient.all
  added_ingredient = all_ingredients.sample
  
  recipe = Recipe.new(
    name: name,
    description: description,
    rating: rating
    )
  recipe.save!

  rand(2..5).times do
    Dose.new(ingredient: added_ingredient, recipe: recipe)
      all_ingredients -= [added_ingredient]
  end
end
