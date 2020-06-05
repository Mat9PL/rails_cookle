class Ingredient < ApplicationRecord
  has_many :doses

  def set_regex(regex)
    @regex = regex
    self.save!
  end

  def self.create_new(attributes = {})
    name = attributes[:name]
    new_ingredient = Ingredient.new(name: name, regex: "(\\b#{name}\\b)|(\\b#{name.pluralize}\\b)")
    new_ingredient[:regex] = attributes[:regex] if attributes[:regex]
    new_ingredient
  end
  
  def self.generate_ingredients(ingredients_list)
    ingredients_list.each do |ingredient| 
      new_ingredient = Ingredient.create_new(ingredient)
      new_ingredient.save!
      puts "#{new_ingredient.name} created!"
    end
  end
end
