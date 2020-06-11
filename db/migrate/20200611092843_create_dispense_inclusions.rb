class CreateDispenseInclusions < ActiveRecord::Migration[6.0]
  def change
    create_table :dispense_inclusions do |t|
      t.references :dispense, null: false, foreign_key: true
      t.references :ingredient_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
