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


  def get_choice
    puts "Enter number to see link phone on browser.".colorize(:cyan)
    puts "next for more phones".colorize(:green)
    puts "Or enter exit to re-scrape.".colorize(:blue)
    gets.chomp
  end

  
end