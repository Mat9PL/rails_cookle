class AddIngredientsTextToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :ingredients_text, :string
  end
end
