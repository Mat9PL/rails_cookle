class CookbooksController < ApplicationController
def show
  @cookbook = Cookbook.find(params[:id])
  authorize @cookbook
end
end
