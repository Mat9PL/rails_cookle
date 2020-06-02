class RemoveIngredientReferenceFromRecipe < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :ingredient_id
  end
end
