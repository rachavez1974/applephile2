require "spec_helper"
require_relative "../lib/command_line_interface.rb"

RSpec.describe "CLI" do                  
  # describe "#run" do
  #   it "it is responsible for interacting with user, it directs input to right methods" do
  #     cli_one = CLI.new.run
  #     cli_one_scrape = cli_one.instance_variable_get(:@scrape)
  #     expect(cli_one_scrape).to be_a_kind_of(CraigsList)
  #     expect($stdout).to receive(:puts).with("WELCOME TO CRAIGSLIST SCRAPPER!")

      
  #   end
  # end

  describe "#display_main_menu" do
    it "it displays the main menu" do
      welcome_stars = "************************".colorize(:yellow)
      expect(display_main_menu.stars).to match(welcome_stars) 
      expect($stdout).to receive(:puts).with("#{welcome_stars} MAIN MENU #{welcome_stars}")
      expect($stdout).to receive(:puts).with("Enter \"scrape\" to scrape.".colorize(:blue))
      expect($stdout).to receive(:puts).with("Enter \"exit\" to end program.".colorize(:yellow))
      expect($stdout).to receive(:puts).with("What would you like to do?".colorize(:blue))
        ["exit", "scrape"].each do |string|
          expect(self).to receive(:gets).and_return(string)
          expect(display_main_menu).to eq(string)
        end
    end
  end

end


