class AddRegexToIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :ingredients, :regex, :string
  end
end
