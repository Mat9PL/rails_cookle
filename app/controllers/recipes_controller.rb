class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    @search = params[:search][:multiple_search]
    @search.delete_at(0)
    @search_results = @search.map do |ingredient_id|
      Ingredient.find(ingredient_id.to_i).name
    end
    @all_recipes = policy_scope(Recipe)
    @recipes = select_recipes_including(@search_results)
  end

  private

  def select_recipes_including(search_results)
    search_results.sort!
    searched_ingredients = search_results.map { |ingredient_name| Ingredient.where(name: ingredient_name)}
    @all_recipes.select { |recipe| (recipe.ingredients - searched_ingredients.flatten).empty? }
  end
end
