class Pantry < ApplicationRecord
  belongs_to :user
  has_many :pantry_inclusions
  has_many :ingredient_groups, through: :pantry_inclusions
end
