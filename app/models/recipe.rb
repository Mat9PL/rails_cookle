class Recipe < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses

  def scrape_ingredients! # analyses the ingredients_text of a recipe to match ingredients
    self.doses.destroy_all
    Ingredient.all.each do |ingredient|
      if self.ingredients_text.match(ingredient.name)
        new_dose = Dose.new(recipe: self, ingredient: ingredient)
        new_dose.save!
        puts "---#{recipe.name} contains #{ingredient.name}"
      end
    end
  end
end
