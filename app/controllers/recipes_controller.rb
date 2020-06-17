require 'will_paginate/array'

class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @ingredient_groups = IngredientGroup.all
    
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
    # p @recipes
    if Cookbook.where(user: current_user).empty?
      @cookbook = Cookbook.new(user: current_user)
      @cookbook.save
    else
      @cookbook = current_user.cookbook    
    end
  end

  private

  def select_recipes_including(searched_ingredient_ids)
    searched_ingredient_ids = searched_ingredient_ids.uniq
    # @all_recipes.select { |recipe| (recipe.ingredient_ids - searched_ingredient_ids.flatten).empty? }
    
    unwanted_ingredient_ids = Ingredient.all.ids - searched_ingredient_ids

    sql = "SELECT DISTINCT recipes.id FROM recipes
    JOIN doses
    ON recipes.id = doses.recipe_id
    "
    # WHERE NOT ingredient_id=26523 AND NOT ingredient_id=26522 AND NOT ingredient_id=26521 AND NOT ingredient_id=26520 AND NOT ingredient_id=26519
    
    unwanted_ingredient_ids.each_with_index do |ingredient_id, idx|
      if idx == 0
        sql += "WHERE ingredient_id=#{ingredient_id}"
      else
        sql += " OR ingredient_id=#{ingredient_id}"
      end
    end
    results = ActiveRecord::Base.connection.execute(sql)
    r = results.map do |result|
      result['id']
    end
    Recipe.all.ids - r
    # sql = "NOT ("
    # r.each_with_index do |el, idx|
    #   if idx == 0
    #     sql += "id=#{el}"
    #   else
    #     sql += " OR id=#{el}"
    #   end
    # end
    # sql += ");"
    # # results = ActiveRecord::Base.connection.execute(sql)
    # Recipe.where(sql)
  end
end
