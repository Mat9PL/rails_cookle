class CookbooksController < ApplicationController
  def show
    if Cookbook.where(user: current_user).empty?
      @cookbook = Cookbook.new(user: current_user)
      @cookbook.save
    else
      @cookbook = Cookbook.where(user: current_user).first
    end
    authorize @cookbook
    @recipes = Recipe.all.take(20)
  end

  def favourite
    # si je clique sur le boutton

    # j'ajoute une ligne dans la table cookbook
  end
end
