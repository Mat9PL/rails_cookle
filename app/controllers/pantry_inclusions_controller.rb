class PantryInclusionsController < ApplicationController
  def create
    set_pantry
    set_input # i.e. get the ingredient groups typed by the user from params
    set_input_ingredients
    update_pantry_inclusions # destroy previous and add new
    authorize @pantry
    redirect_to pantry_path(@pantry)
  end

  private

  def set_pantry
    @pantry = Pantry.find(params[:pantry_id])
  end

  def set_input
    @input = params[:search][:multiple_search] - [""]
  end

  def set_input_ingredients
    @input_ingredients = @input.map { |id| IngredientGroup.find(id.to_i) }
  end

  def update_pantry_inclusions
    @pantry.pantry_inclusions.destroy_all
    @input_ingredients.each { |ing| PantryInclusion.create(pantry: @pantry, ingredient_group: ing) }
  end
end
