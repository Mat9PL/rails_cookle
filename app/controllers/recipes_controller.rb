require 'will_paginate/array'

class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @ingredient_groups = IngredientGroup.all.reverse
    if @search = params[:search].nil?
      @search = params[:multiple_search][:multiple_search] - [""]
    else
      @search = params[:search][:multiple_search] - [""]
    end
    @searched_ingredient_ids = []
    @search.each do |ingredient_group_id|
      ingredient_group = IngredientGroup.find(ingredient_group_id.to_i)
      @searched_ingredient_ids += ingredient_group.ingredient_ids
    end
    @searched_ingredient_groups = @search.map do |id|
      IngredientGroup.find(id)
    end
    @all_recipes = policy_scope(Recipe)
    @found_recipes = select_recipes_including(@searched_ingredient_ids)
    @recipes = @found_recipes.paginate(page: params[:page], per_page: 12)
  end
  
  private
  
  def select_recipes_including(searched_ingredient_ids)
    searched_ingredient_ids = searched_ingredient_ids.uniq
    @all_recipes.select { |recipe| (recipe.ingredient_ids - searched_ingredient_ids.flatten).empty? }
  end
end
