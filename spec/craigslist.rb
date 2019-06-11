require "spec_helper"
require_relative "../lib/craigslist.rb"


RSpec.describe "CraigsList" do                  
  let!(:cl_first) {CraigsList.new()}
  let!(:state_names) { 
                  ['Alabama','Alaska','American Samoa','Arizona','Arkansas','California',
                  'Colorado','Connecticut','Delaware','District of Columbia','Florida',
                  'Georgia','Guam','Hawaii',
                  'Idaho','Illinois','Indiana','Iowa','Kansas','Kentucky','Louisiana',
                  'Maine','Marshall Islands','Maryland','Massachusetts','Michigan',
                  'Minnesota','Mississippi','Missouri','Montana','Nebraska','Nevada',
                  'New Hampshire','New Jersey','New Mexico','New York','North Carolina',
                  'North Dakota','Northern Mariana Islands','Ohio','Oklahoma','Oregon',
                  'Palau','Pennsylvania','Rhode Island','South Carolina',
                  'South Dakota','Tennessee','Texas','Utah','Vermont','Virgin Island',
                  'Virginia','Washington','West Virginia','Wisconsin','Wyoming']
                }
  def choose_random_state
    state_names[rand(0..state_names.length - 1)]
  end



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

  describe "#get_states_names" do
    it "it visits the about page of craiglist and collects all the states names of the U.S." do
      state_names = cl_first.get_states_names
      expect(state_names).to include(choose_random_state)
    end
  end

end
