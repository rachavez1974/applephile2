require "spec_helper"
require_relative '../lib/city.rb'

RSpec.describe "City" do                  
  let!(:bellingham) {City.new({:name=>"bellingham", :state=>"Washington",
                                            :keyword => "iphone new brand new iphone",
                                            :city_url => "www.google.com", :items => []})
                    }
  
  
  after(:each) do 
    City.class_variable_set(:@@all, [])
  end
  describe "#initialize" do
    it "takes in an argument of a hash and sets that new city's attributes using the key/value pairs of that hash." do
      expect{City.new({:name => "jacksonville", :state => "Florida", 
                       :keyword=>"new car barnd new car", 
                       :city_url=>"www.city.com", :items=>[]})}.to_not raise_error

      expect(bellingham.name).to eq("bellingham")
      expect(bellingham.state).to eq("Washington")
      expect(bellingham.keyword).to eq("iphone new brand new iphone")
      expect(bellingham.city_url).to eq("www.google.com")
      expect(bellingham.items).to match_array([])

    end
  end
end
