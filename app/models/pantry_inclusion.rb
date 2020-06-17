class PantryInclusion < ApplicationRecord
  belongs_to :pantry
  belongs_to :ingredient_group
end
