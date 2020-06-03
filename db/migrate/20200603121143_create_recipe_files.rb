class CreateRecipeFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_files do |t|
      t.string :source
      t.string :url
      t.string :content

      t.timestamps
    end
  end
end
