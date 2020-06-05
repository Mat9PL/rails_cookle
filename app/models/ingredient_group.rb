class IngredientGroup < ApplicationRecord
  has_many :ingredient_groupers
  has_many :ingredients, through: :ingredient_groupers

  def self.generate_ingredient_groups(groups)
    groups.keys.each do |key| 
      ingredient_group = IngredientGroup.new(name: key)
      ingredient_group.save!
      puts "#{ingredient_group.name} created!"
    end
  end

  def group_ingredients!(group)
    # self.ingredient_groupers.destroy_all
    puts self.name
    group.each do |categorized_ingredient|
      Ingredient.all.each do |ingredient|
        if categorized_ingredient.match(ingredient.regex)
          new_grouper = IngredientGrouper.new(ingredient_group: self, ingredient: ingredient)
          puts "---contains #{ingredient.name}, #{new_grouper.valid?}"
          new_grouper.save
          puts self.ingredients.count
        end
      end
    end
  end
end
