class ChangeDispenseInclusionsToPantryInclusions < ActiveRecord::Migration[6.0]
  def change
    rename_table :dispense_inclusions, :pantry_inclusions
  end
end
