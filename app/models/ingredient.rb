class Ingredient < ApplicationRecord
  has_many :doses

  def set_regex(regex)
    @regex = regex
    self.save!
  end

  def self.create_new(attributes = {})
    name = attributes[:name]
    new_ingredient = Ingredient.new(name: attributes[:name], regex: build_regex(attributes))
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

  def groupify
    ing_group = IngredientGroup.new(name: self.name)
    ing_group.save!
    IngredientGrouper.new(ingredient_group: ing_group, ingredient: self).save!
  end

  private

  def build_regex(attributes = {})
  # example: attributes = {name: 'cheese', forbidden_prefixes: ["gruyère", "stilton", "mascarpone"], synonyms: ["queso"]}
  forbidden_prefixes = ""
  name = attributes[:name]
  attributes[:forbidden_prefixes].each { |prefix| forbidden_prefixes += "(?<!#{prefix + " "})" }
  regex = "(#{forbidden_prefixes}\\b#{name}\\b)|(#{forbidden_prefixes}\\b#{name.pluralize}\\b)"
  attributes[:synonyms].each { |synonym| regex += "|(#{forbidden_prefixes}\\b#{synonym}\\b)|(#{forbidden_prefixes}\\b#{synonym.pluralize}\\b)" }
  regex
end
end
