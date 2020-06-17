class ChangeDispenseIdToPantryIdInPantryInclusions < ActiveRecord::Migration[6.0]
  def change
    rename_column :pantry_inclusions, :dispense_id, :pantry_id
  end
end
