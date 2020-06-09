class Recipe < ApplicationRecord
  has_many :doses
  has_many :ingredients, through: :doses
  belongs_to :url, optional: true

  WillPaginate.per_page = 6

  def scrape_ingredients! # analyses the ingredients_text of a recipe to match ingredients
    self.doses.destroy_all
    puts "---#{self.name} contains:"
    Ingredient.all.each do |ingredient|
      regex = Regexp.new(ingredient.regex)
      if self.ingredients_text.match(regex)
        new_dose = Dose.new(recipe: self, ingredient: ingredient)
        new_dose.save!
        puts "#{ingredient.name}"
      end
    end
  end
end
