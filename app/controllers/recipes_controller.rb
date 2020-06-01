class RecipesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def index
    @recipes = policy_scope(Recipe)
  end
end
