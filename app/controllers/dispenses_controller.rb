class DispensesController < ApplicationController
  def show
    @ingredient_groups = IngredientGroup.all
    if Dispense.where(user: current_user).empty?
      @dispense = Dispense.new(user: current_user)
      @dispense.save
    else
      @dispense = Dispense.where(user: current_user).first
    end
    @ingredient_group_ids = @dispense.ingredient_groups.map {|ing| ing.id.to_s }
    skip_authorization
  end
end
