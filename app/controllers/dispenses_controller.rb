class DispensesController < ApplicationController
  def show
    @ingredient_groups = IngredientGroup.all
    if Dispense.where(user: current_user).empty?
      @dispense = Dispense.new(user: current_user)
      @dispense.save
    else
      @dispense = Dispense.where(user: current_user).first
    end
    authorize @dispense
  end
end
