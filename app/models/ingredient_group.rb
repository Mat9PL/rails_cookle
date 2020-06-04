class IngredientGroup < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses

end
