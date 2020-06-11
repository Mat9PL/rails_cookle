class DispenseInclusion < ApplicationRecord
  belongs_to :dispense
  belongs_to :ingredient_group
end
