class PantryInclusionsController < ApplicationController
  def create
    @pantry = Pantry.find(params[:pantry_id])
    @input = params[:search][:multiple_search] - [""]
    @searched_ingredients = @input.map do |ingredient_group_id|
      IngredientGroup.find(ingredient_group_id.to_i)
    end
    @pantry.Pantry_inclusions.destroy_all
    @searched_ingredients.each do |ing|
      PantryInclusion.new(Pantry: @pantry, ingredient_group: ing).save
    end
    authorize @pantry
    redirect_to Pantry_path(@pantry)
  end
end
