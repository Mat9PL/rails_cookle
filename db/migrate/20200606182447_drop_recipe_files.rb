class DropRecipeFiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :urls, :recipe_file_id
    remove_column :recipes, :recipe_file_id
    drop_table :recipe_files
  end
end
