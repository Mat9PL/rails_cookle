require 'open-uri'
require 'nokogiri'

class Url < ApplicationRecord
  has_one :recipe

  def self.scrape_links_from_bbc_good_food # returns array of urls to recipe files on BBC Good Food
    1000.times do |index| # 883 pages in total
      # get results from search page
      search_url = "https://www.bbcgoodfood.com/search/video/feed/rss2?page=#{index}"
      # problem: on page 296 with stuffed mushrooms
      html_search_file = open(search_url).read

      # parse results to obtain urls of each page
      nokogiri_file_search_results = Nokogiri::HTML(html_search_file)
      nokogiri_file_search_results.search('.teaser-item__title a').each do |recipe|
        url = "https://www.bbcgoodfood.com/#{recipe.attribute('href').value}"
        Url.new(url: url).save!

      end
    end
  end

  def unmark_imported!
    self.imported = false
    self.save!
  end

  def import! # builds a RecipeFile instance
    url = self.url
    if self.imported
      puts "#{url} is already in the database!"
    else
      content = open(url).read
      nokogiri_file = Nokogiri::HTML(content)

      new_recipe = Recipe.new(
        name: nokogiri_file.search('h1').text.strip,
        url_image: nokogiri_file.search('.ratio-11-10 img')[0].attributes['src'].value,
        ingredients_text: nokogiri_file.search('.ingredients-list__item').map { |element| element.text.strip }.join(" ").downcase,
        description: (nokogiri_file.search('.method__item p').map { |element| element.text.strip }).join(" "),
        url: self,
        source: url.match(/([a-z]+\.[a-z]+)\//)
      )

      if new_recipe.save!
        puts "-recipe for #{new_recipe[:name]} created"
        puts "from #{url}"
      else
        puts "ERROR - #{url} couldn't be added to the database"
      end
      self.imported = true
      self.save!
    end
  end
end
