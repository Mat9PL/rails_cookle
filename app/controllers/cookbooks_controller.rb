class CookbooksController < ApplicationController
  def show
    if Cookbook.where(user: current_user).empty?
      @cookbook = Cookbook.new(user: current_user)
      @cookbook.save
    else
      @cookbook = Cookbook.where(user: current_user).first
    end
    authorize @cookbook
  end

  def favourite


  end
end
