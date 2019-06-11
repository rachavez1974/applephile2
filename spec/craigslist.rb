require "spec_helper"
require_relative "../lib/craigslist.rb"

RSpec.describe "CraigsList" do                  
  let!(:cl_first) {CraigsList.new()}

  after(:each) do 
    CraigsList.class_variable_set(:@@all, [])
  end
  describe "#initialize" do
    it "it has default values" do
      cl_second = CraigsList.new()

      cl_second_site = cl_second.instance_variable_get(:@site_url)
      cl_second_doc = cl_second.instance_variable_get(:@doc)
    
      expect(cl_second_site).to eq("https://www.craigslist.org/about/sites")
      expect(cl_second_doc).to eq(cl_second.doc)
    
    end
  end
end
