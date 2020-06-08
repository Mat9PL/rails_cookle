class RemoveUrlTextFromRecipes < ActiveRecord::Migration[6.0]
  def change
    remove_column :recipes, :url_text
  end
end
