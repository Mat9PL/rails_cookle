class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    @search = ['egg', 'pasta', 'potato', 'onion'] #
    @recipes = select_recipes_including(@search)
    
    # @recipes = Recipe.all
  end

  private

  def select_recipes_including(search_results)
    search_results.sort!
    searched_ingredients = search_results.map { |ingredient_name| Ingredient.where(name: ingredient_name)}
    Recipe.select { |recipe| (recipe.ingredients - searched_ingredients.flatten).empty? }
  end
end
