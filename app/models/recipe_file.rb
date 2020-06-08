require 'open-uri'
require 'nokogiri'

class RecipeFile < ApplicationRecord
  has_one :url
  has_one :recipe

  # BBC Good Food



  # def convert_bbc_recipe_file # builds a Recipe instance from a RecipeFile instance from BBC Good Food
  #   nokogiri_file = Nokogiri::HTML(self.content)

  #   # generate recipe from scraped info


  #   new_recipe.save!
  #   puts "-recipe for #{new_recipe[:name]} created"
  # end
end
