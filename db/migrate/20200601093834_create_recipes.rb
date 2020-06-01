class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :name
      t.text :description
      t.string :url
      t.integer :rating
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
