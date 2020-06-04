class Recipe < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses

  def scrape_ingredients! # analyses the ingredients_text of a recipe to match ingredients
    self.doses.destroy_all
    Ingredient.all.each do |ingredient|
      regex = Regexp.new(ingredient.regex)
      if self.ingredients_text.match(regex)
        new_dose = Dose.new(recipe: self, ingredient: ingredient)
        new_dose.save!
        puts "---#{self.name} contains #{ingredient.name}"
      end
    end
  end
end
