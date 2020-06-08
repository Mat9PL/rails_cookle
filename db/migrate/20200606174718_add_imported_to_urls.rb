class AddImportedToUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :imported, :boolean
  end
end
