class PantriesController < ApplicationController
  def show
    set_ingredient_groups # for the select2 in the search bar
    set_pantry
    skip_authorization
    set_ingredient_group_ids # for the search button
  end
  
  private
  
  def set_ingredient_groups
    @ingredient_groups = IngredientGroup.all
  end
  
  def set_pantry
    @pantry = current_user.pantry ? Pantry.create(user: current_user) : @pantry = Pantry.where(user: current_user).first
  end
  
  def set_ingredient_group_ids
    @ingredient_group_ids = @pantry.ingredient_groups.map {|ing| ing.id.to_s }
  end
end
