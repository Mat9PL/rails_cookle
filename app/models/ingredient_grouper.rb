class IngredientGrouper < ApplicationRecord
  belongs_to :ingredient
  belongs_to :ingredient_group
end
