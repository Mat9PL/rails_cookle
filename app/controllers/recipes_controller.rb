class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]
  def index
    @search = params[:search][:multiple_search]
    p @search
    @search.delete_at(0)
    @searched_ingredients = []
    @search.each do |ingredient_group_id|
      ingredient_group = IngredientGroup.find(ingredient_group_id.to_i)
      @searched_ingredients += ingredient_group.ingredients
    end
    @all_recipes = policy_scope(Recipe)
    @recipes = select_recipes_including(@searched_ingredients)
    p @searched_ingredients.map {|e| e.name}
  end

  private

  def convert_to_ingedients(ingredient_group)
    ingredient_group.ingredients
  end


  def select_recipes_including(searched_ingredients)
    searched_ingredients = searched_ingredients.uniq
    @all_recipes.select { |recipe| (recipe.ingredients - searched_ingredients.flatten).empty? }
  end
end
