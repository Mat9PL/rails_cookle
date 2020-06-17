require 'will_paginate/array'

class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    policy_scope(Recipe)
    set_cookbook # for the link to the cookbook in the navbar
    set_ingredient_groups # for the select2 in the search bar
    set_search # from params
    set_searched_ingredient_groups # to pre-populate the search bar
    set_found_recipes # to get the number of all the recipes found
    set_recipes # to get paginated list of recipes to display
  end

  private

  def set_recipes
    @recipes = @found_recipes.paginate(page: params[:page], per_page: 10)
  end

  def set_searched_ingredient_groups
    @searched_ingredient_groups = @search.map { |id| IngredientGroup.find(id) }
  end

  def set_found_recipes
    @found_recipes = select_recipes_including_only(convert_group_ids_to_ingredient_ids(@search))
  end

  def set_cookbook
    @cookbook = Cookbook.where(user: current_user).empty? ? Cookbook.create(user: current_user) : current_user.cookbook  
  end

  def set_ingredient_groups
    @ingredient_groups = IngredientGroup.all
  end

  def set_search
    @search = (params[:search].nil? ? params[:multiple_search][:multiple_search] : params[:search][:multiple_search])- [""]
  end

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
