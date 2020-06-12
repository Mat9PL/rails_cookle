class CookbookInclusionsController < ApplicationController
  def create
    @cookbook = Cookbook.find(params[:cookbook_id])
    @recipe = Recipe.find(params[:recipe_id])
    @cookbook_inclusion = CookbookInclusion.new(cookbook: @cookbook, recipe: @recipe)
    @cookbook_inclusion.save
    # authorize @cookbook_inclusion
    skip_authorization
    redirect_to recipes_path(search: {multiple_search: params[:searched]})
  end

  def destroy
    @cookbook_inclusion = CookbookInclusion.find(params[:id])
    @cookbook = @cookbook_inclusion.cookbook
    @cookbook_inclusion.destroy
    # authorize @cookbook_inclusion
    skip_authorization
    if params[:from] == 'cookbooks'
      redirect_to cookbook_path(current_user.id)
    else
      redirect_to recipes_path(search: {multiple_search: params[:searched]})
    end
  end
end
