class CreateIngredientGroupers < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredient_groupers do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :ingredient_group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
