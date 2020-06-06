class AddSourceToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :source, :string
    add_reference :recipes, :url, index: true
  end
end
