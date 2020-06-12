class CookbookInclusionsController < ApplicationController
  def create
    @cookbook = Cookbook.find(params[:cookbook_id])
    @recipe = Recipe.find(params[:recipe_id])
    @cookbook_inclusion = CookbookInclusion.new(cookbook: @cookbook, recipe: @recipe)
    @cookbook_inclusion.save
    # authorize @cookbook_inclusion
    skip_authorization
    end

  def destroy
    @cookbook_inclusion = CookbookInclusion.find(params[:id])
    @cookbook = @cookbook_inclusion.cookbook
    @cookbook_inclusion.destroy
    # authorize @cookbook_inclusion
    skip_authorization
    end
end
