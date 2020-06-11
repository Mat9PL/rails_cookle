class DispenseInclusionsController < ApplicationController
  def create
    @dispense = Dispense.find(params[:dispense_id])
    @input = params[:search][:multiple_search] - [""]
    @searched_ingredients = @input.map do |ingredient_group_id|
      IngredientGroup.find(ingredient_group_id.to_i)
    end
    @dispense.dispense_inclusions.destroy_all
    @searched_ingredients.each do |ing|
      DispenseInclusion.new(dispense: @dispense, ingredient_group: ing).save
    end
    authorize @dispense
    redirect_to dispense_path(@dispense)
  end
end
