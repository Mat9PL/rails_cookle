class CookbookInclusionsController < ApplicationController

  def create
    @cookbook = Cookbook.find(params[:cookbook_id])
    @recipe = Recipe.find(params[:recipe_id])
    @cookbook_inclusion = CookbookInclusion.new(cookbook: @cookbook, recipe: @recipe)
    @cookbook_inclusion.save
    authorize @cookbook_inclusion
    redirect_to cookbook_path(@cookbook)
  end

  def destroy
    @cookbook_inclusion = CookbookInclusion.find(params[:id])
    authorize @cookbook_inclusion
    @cookbook_inclusion.destroy
  end
end
