class CreateCookbookInclusions < ActiveRecord::Migration[6.0]
  def change
    create_table :cookbook_inclusions do |t|
      t.references :cookbook, null: false, foreign_key: true
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
