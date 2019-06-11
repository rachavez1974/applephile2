require 'nokogiri'
require 'open-uri'
require 'pry'

class CraigsList
  attr_accessor :site_url, :doc
  @@all = []
  

  def initialize()
    @site_url = "https://www.craigslist.org/about/sites"
    @doc = Nokogiri::HTML(open(@site_url))  
    @@all << self
  end
end

