class Recipe < ApplicationRecord
  belongs_to :doses
  has_many :ingredients, through: :doses
end
