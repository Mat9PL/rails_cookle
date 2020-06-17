class CookbooksController < ApplicationController
  def show
    set_cookbook
    authorize @cookbook
    set_recipes
  end
  
  def set_cookbook
    @cookbook = Cookbook.where(user: current_user).empty? ? Cookbook.create(user: current_user) : Cookbook.where(user: current_user).first
  end
  
  def set_recipes
    @recipes = @cookbook.recipes
  end
end
