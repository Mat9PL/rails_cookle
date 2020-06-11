class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @ingredient_groups = IngredientGroup.all.reverse
  end

end
