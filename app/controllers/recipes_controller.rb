require 'will_paginate/array'

class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  def index
    @search = params[:search][:multiple_search]
    @searched_ingredients = []
    @search.each do |ingredient_group_id|
      unless ingredient_group_id == ""
        ingredient_group = IngredientGroup.find(ingredient_group_id.to_i)
        @searched_ingredients += ingredient_group.ingredients
      end
    end
    @all_recipes = policy_scope(Recipe)
    @found_recipes = select_recipes_including(@searched_ingredients)
    @recipes = []
    @found_recipes.each do |found_recipe|
      @recipes.push(found_recipe)
    end
    # @recipes = policy_scope(Recipe).select do |recipe|
    #   recipe.ingredients.include?(Ingredient.all.select do |ingredient|
    #     ingredient.name.include?("a")
    #     end)[0]
    #   end
    @recipes = @recipes.paginate(page: params[:page], per_page: 6)
    @searched_ingredients.map { |e| e.name }
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
