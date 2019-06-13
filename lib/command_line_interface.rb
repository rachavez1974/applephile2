class CLI

  INTRO_MESSAGE = "WELCOME TO CRAIGSLIST SCRAPPER!"

  def display_main_menu
    stars = "************************".colorize(:yellow)
    puts "#{stars} MAIN MENU #{stars}" 
    puts "Enter \"scrape\" to scrape.".colorize(:blue)
    puts "Enter \"exit\" to end program.".colorize(:yellow)
    puts "What would you like to do?".colorize(:blue)
    gets.chomp
  end

  def get_menu_input
    display_states
    puts "Please enter a number for the state you'd like to scrape.".colorize(:green)
    #convert number input from user
    @state_scraped = convert_to_state(gets.chomp)
    display_cities(@state_scraped)
    puts "Please enter a number for the city you'd like to scrape.".colorize(:green)
    @city_scraped = convert_to_city(@state_scraped, gets.chomp)
    puts "You have chosen the state of #{@state_scraped}, and the city of #{@city_scraped.capitalize}."
  end  

  def display_states
    @scrape.get_states_names.each_with_index do |state, index|
      print "#{index + 1}. #{state}    ".ljust(28) 
      if (index + 1) % 5 == 0
        print "\n"
      end
    end
    print "\n"
  end  

  def scrape_phones
    @scraped_city_url = @scrape.return_city_link(@state_scraped, @city_scraped)
    @phones = @scrape.scrape_by_city_url(@scraped_city_url)
  end

  def create_items_from_array(phones_array)
    if phones_array.empty?
      puts "Your search return zero hits, please scrape again"
      get_menu_input
      create_items_from_array(scrape_phones())
    else
      @city = City.new({:name => @city_scraped, :state => @state_scraped,
                        :city_url => @scraped_city_url})
      phones_array.each do |phone_info| 
        @city.add_item(Item.new(phone_info))
      end
    end
  end

  def get_choice
    puts "Enter number to see link phone on browser.".colorize(:cyan)
    puts "next for more phones".colorize(:green)
    puts "Or enter exit to re-scrape.".colorize(:blue)
    gets.chomp
  end

  
end