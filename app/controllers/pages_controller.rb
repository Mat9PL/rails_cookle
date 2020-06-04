class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @ingredients = Ingredient.all.select { |ingredient| ingredient.doses.length >= 0 }
    @useless = Ingredient.all.select { |ing| ing.doses.length == 0 }
  end

end
