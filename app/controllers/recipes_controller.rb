require 'will_paginate/array'

class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @ingredient_groups = IngredientGroup.all
    
    if params[:search].nil?
      @search = params[:multiple_search][:multiple_search] - [""]
    else
      @search = params[:search][:multiple_search] - [""]
    end
    
    @searched_ingredient_groups = @search.map { |id| IngredientGroup.find(id) }
    @all_recipes = policy_scope(Recipe)
    @ingredient_ids = convert_group_ids_to_ingredient_ids(@search)
    @found_recipes = select_recipes_including_only(@ingredient_ids)
    @recipes = @found_recipes.paginate(page: params[:page], per_page: 10)
    Cookbook.where(user: current_user).empty? ? @cookbook = Cookbook.create(user: current_user) : @cookbook = current_user.cookbook    
  end

  private

  def convert_group_ids_to_ingredient_ids(array)
    ingredient_ids = []
    array.each { |id| ingredient_ids += IngredientGroup.find(id.to_i).ingredient_ids }
    ingredient_ids
  end

  def select_recipes_including_only(ingredient_ids)
    unwanted_ingredient_ids = Ingredient.all.ids - ingredient_ids.uniq
    query = "SELECT DISTINCT recipes.id FROM recipes JOIN doses ON recipes.id = doses.recipe_id "
    # example: WHERE NOT ingredient_id=26523 AND NOT ingredient_id=26522 AND NOT ingredient_id=26521 AND NOT ingredient_id=26520 AND NOT ingredient_id=26519
    unwanted_ingredient_ids.each_with_index do |ingredient_id, idx|
      idx == 0 ? query += "WHERE ingredient_id=#{ingredient_id}" : query += " OR ingredient_id=#{ingredient_id}"
    end
    Recipe.all.ids - ActiveRecord::Base.connection.execute(query).map { |result| result['id'] }
  end
end
