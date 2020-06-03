class AddRecipeFileToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :recipe_file, index: true
  end
end
