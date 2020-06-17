class ChangeDispensesToPantries < ActiveRecord::Migration[6.0]
  def change
    rename_table :dispenses, :pantries
  end
end
