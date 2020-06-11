class Dispense < ApplicationRecord
  belongs_to :user
  has_many :dispense_inclusions
  has_many :ingredient_groups, through: :dispense_inclusions
end
