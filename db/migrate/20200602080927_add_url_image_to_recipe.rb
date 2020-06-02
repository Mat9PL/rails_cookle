class AddUrlImageToRecipe < ActiveRecord::Migration[6.0]
  def change
    add_column :recipes, :url_image, :string
  end
end
