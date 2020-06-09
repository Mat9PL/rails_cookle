require 'will_paginate/array'

class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @search = params[:search][:multiple_search]
    @searched_ingredients = []
    @search.each do |ingredient_group_id|
      unless ingredient_group_id == ""
        ingredient_group = IngredientGroup.find(ingredient_group_id.to_i)
        @searched_ingredients += ingredient_group.ingredient_ids
      end
    end
    @all_recipes = policy_scope(Recipe)
    @found_recipes = select_recipes_including(@searched_ingredients)
    @recipes = @found_recipes.paginate(page: params[:page], per_page: 12)
  end
  
  private
  
  def select_recipes_including(searched_ingredients)
    searched_ingredients = searched_ingredients.uniq
    @all_recipes.select { |recipe| (recipe.ingredient_ids - searched_ingredients.flatten).empty? }
  end
end
