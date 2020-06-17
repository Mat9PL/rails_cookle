class PantriesController < ApplicationController
  def show
    @ingredient_groups = IngredientGroup.all
    if Pantry.where(user: current_user).empty?
      @pantry = Pantry.new(user: current_user)
      @pantry.save
    else
      @pantry = Pantry.where(user: current_user).first
    end
    @ingredient_group_ids = @pantry.ingredient_groups.map {|ing| ing.id.to_s }
    skip_authorization
  end
end
