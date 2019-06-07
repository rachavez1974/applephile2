require 'nokogiri'
require 'open-uri'

class CraigsListScraper
  
  attr_accessor :site_url, :doc, :date, :number
  @@all = []

  def initialize()
    @site_url = "https://www.craigslist.org/about/sites"
    @doc = Nokogiri::HTML(open(@site_url))
    @items = []
    @date = Time.now
    @number = rand(1..100)
    @@all << self
  end

  def return_city_url(city)
    #it take a string in, then finds city, and returns its link
    #run through the html document and find the link that has name @city
    #city_url
  end

  def scrape_by_city_url(city)
    #visit city url
    #scrape for items that match keyword
    #return an array of hashes for those items with attributes available
  end

  def add_item(item)
    #add item here and associate to city through item
  end

  def self.all
    @@all
  end
end

c1 = CraigsListScraper.new()
# {:name=>"jacksonville", :state=>"Florida", 
#   :keyword=>"iphone new brand new iphone", :city_url=>"www.city.com", :items=>[]})

