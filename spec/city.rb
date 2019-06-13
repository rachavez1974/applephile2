require "spec_helper"
require_relative "../lib/city.rb"

RSpec.describe "City" do
  let!(:cl_first) {CraigsList.new()}
  let!(:scraped_city_url) {cl_first.return_city_link("New Mexico", "clovis") }
  let!(:city_hash) {{:name => "clovis", :state => "New Mexico",
                    :city_url => scraped_city_url}}
  let!(:first_city) {City.new(city_hash)}  
  let!(:phone_hash) {cl_first.scrape_by_city_url(scraped_city_url) }
  let!(:first_phone) {phone_hash.first }

  describe "#initialize" do
    it "accepts a hash of attributes to assign" do
      city_one_name = first_city.instance_variable_get(:@name)
      city_one_state = first_city.instance_variable_get(:@state)
      city_one_url = first_city.instance_variable_get(:@city_url)
      
      expect(city_one_name).to eq("clovis")
      expect(city_one_state).to eq("New Mexico")
      expect(city_one_url).to eq("https://clovis.craigslist.org/")
    end
  end

  describe "#add_item" do
    it "it accpets an item, and adds it to @items instance variable for city, and it returns that item" do
      item = Item.new(first_phone)
      city_item = first_city.add_item(item)
      
      expect(first_city.items).to include(item)
      expect(first_city.add_item(item)).to eq(city_item)
    end
  end





end

