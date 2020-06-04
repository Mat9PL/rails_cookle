require 'open-uri'
require 'nokogiri'

class RecipeFile < ApplicationRecord

  # BBC Good Food

  def self.scrape_links_from_bbc_good_food # returns array of urls to recipe files on BBC Good Food
    urls = []
    882.times do |index|
      # get results from search page
      search_url = "https://www.bbcgoodfood.com/search/video/feed/rss2?page=#{index}"
      # problem: on page 296 with stuffed mushrooms
      html_search_file = open(search_url).read
      
      # parse results to obtain urls of each page
      nokogiri_file_search_results = Nokogiri::HTML(html_search_file)
      nokogiri_file_search_results.search('.teaser-item__title a').each do |recipe|
        urls <<  recipe.attribute('href').value
      end
    end
    urls
  end

  def self.import_from_bbc_good_food(url) # builds a RecipeFile instance from a BBC Good Food url
    unless url == "/recipes/stuffed-mushrooms" # this page doesn't work and stops the method
      file_url = "https://www.bbcgoodfood.com/#{url}"
      html_recipe_file = open(file_url).read
      # create RecipeFile instance
      recipe_file = RecipeFile.new(source: "bbcgoodfood.com", content: html_recipe_file, url: file_url)
      recipe_file.save!
      puts "#{url} has been added to the database"
    end
  end
  
  def convert_bbc_recipe_file # builds a Recipe instance from a RecipeFile instance from BBC Good Food
    nokogiri_file = Nokogiri::HTML(self.content)

    # generate recipe from scraped info
    new_recipe = Recipe.new(
      name: nokogiri_file.search('h1').text.strip,
      url_image: nokogiri_file.search('.ratio-11-10 img')[0].attributes['src'].value,
      ingredients_text: nokogiri_file.search('.ingredients-list__item').map { |element| element.text.strip }.join(" ")
      description: nokogiri_file.search('.method__item p').map { |element| element.text.strip }.join(" "),
      url: self.url,
    )

    new_recipe.save!
    puts "-recipe for #{new_recipe[:name]} created"
  end
end
