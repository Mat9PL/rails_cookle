class IngredientGroup < ApplicationRecord
  has_many :ingredient_groupers, dependent: :destroy
  has_many :ingredients, through: :ingredient_groupers
  has_many :pantry_inclusions

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
        if categorized_ingredient == ingredient.name
          new_grouper = IngredientGrouper.new(ingredient_group: self, ingredient: ingredient)
          new_grouper.save
          puts "-#{self.ingredients.count}--contains #{ingredient.name}, #{new_grouper.valid?}"
        end
      end
    end
  end
end
