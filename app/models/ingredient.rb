class Ingredient < ApplicationRecord
  has_many :doses

  def set_regex(regex)
    @regex = regex
    self.save!
  end

  def self.create_new(attributes = {})
    name = attributes[:name]
    new_ingredient = Ingredient.new(name: attributes[:name])
    new_ingredient[:regex] = new_ingredient.build_regex(attributes)
    new_ingredient[:regex] = attributes[:regex] if attributes[:regex]
    new_ingredient
  end
  
  def self.generate_ingredients(ingredients_list)
    ingredients_list.each do |ingredient| 
      p ingredient
      new_ingredient = Ingredient.create_new(ingredient)
      new_ingredient.save
      puts "#{new_ingredient.name} created!"
    end
  end

  def groupify
    if IngredientGroup.where(name: self.name).empty?
      ing_group = IngredientGroup.new(name: self.name)
      ing_group.save
      IngredientGrouper.new(ingredient_group: ing_group, ingredient: self).save!
    end
  end

  def build_regex(attributes = {name: ''})
  # example: attributes = {name: 'cheese', forbidden_prefixes: ["gruyère", "stilton", "mascarpone"], synonyms: ["queso"]}
    forbidden_prefixes = ""
    name = attributes[:name]
    input_synonyms = attributes[:synonyms]
    input_forbidden_prefixes = attributes[:forbidden_prefixes]
    if input_forbidden_prefixes.class == Array
      input_forbidden_prefixes.each { |prefix| forbidden_prefixes += "(?<!#{prefix + " "})" }
    elsif input_forbidden_prefixes.class == String
      forbidden_prefixes = "(?<!#{input_forbidden_prefixes + " "})"
    end
    regex = "(#{forbidden_prefixes}\\b#{name}\\b)|(#{forbidden_prefixes}\\b#{name.pluralize}\\b)"
    if input_synonyms.class == Array
      input_synonyms.each { |synonym| regex += "|(#{forbidden_prefixes}\\b#{synonym}\\b)|(#{forbidden_prefixes}\\b#{synonym.pluralize}\\b)" }
    elsif input_synonyms.class == String
      regex += "|(#{forbidden_prefixes}\\b#{input_synonyms}\\b)|(#{forbidden_prefixes}\\b#{input_synonyms.pluralize}\\b)"
    end
    regex
  end
end
