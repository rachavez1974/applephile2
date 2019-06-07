
class CLI

  INTRO_MESSAGE = "WELCOME TO CRAIGSLIST SCRAPPER!"
  def run
    puts INTRO_MESSAGE
    choice = ""
    while choice != "exit"      
      choice = display_main_menu
      if choice == "scrape"
        get_menu_input
        make_items()
        display_items
      end
    end
  end

  def display_main_menu
    stars = "************************".colorize(:yellow)
    puts "#{stars} MAIN MENU #{stars}" 

    puts "Enter \"scrape\" to scrape.".colorize(:blue)
    puts "Enter \"exit\" to end program.".colorize(:yellow)
    puts "What would you like to do?".colorize(:blue)
    choice = gets.chomp
  end

  def get_menu_input
    choices = []
    puts "Please choose the state where you want to scrape.".colorize(:green)
    state = gets.chomp
    puts "Please choose the city to scrape.".colorize(:green)
    city = gets.chomp
    puts "you have chosen the state of #{state}, and the city of #{city}."
    choices << state << city
  end

  def make_items
    puts "Making items to be display now."
    
  end

  def display_items
    puts "The following items were found:".colorize(:blue)
    puts "Displaying the first 9 items."
    #display first 9 items
    puts "Enter next to look at the next 9 items, exit to go back to previous menu.".colorize(:green)
    #display next 9 items
    choice = gets.chomp
      while choice != "exit"
        if choice == "next"
          puts "Keep displaying next 9 items"
        end
        puts "Enter next to look at the next 9 items, exit to go back to previous menu.".colorize(:green)
        #display next 9 items
        choice = gets.chomp
      end
  end
end
