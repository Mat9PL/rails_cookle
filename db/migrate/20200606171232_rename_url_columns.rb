class RenameUrlColumns < ActiveRecord::Migration[6.0]
  def change
    rename_column :recipes, :url, :url_text
    rename_column :recipe_files, :url, :url_text
  end
end
