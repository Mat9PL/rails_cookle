class Ingredient < ApplicationRecord
  has_many :doses

  def set_regex(regex)
    @regex = regex
    self.save!
  end

  def self.create_new(attributes = {})
    new_ingredient = Ingredient.new(name: attributes[:name], regex: attributes[:name])
    new_ingredient[:regex] = attributes[:regex] if attributes[:regex]
    new_ingredient
  end
end
