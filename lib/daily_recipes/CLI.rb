class DailyRecipes::CLI

  def greeting
    puts "Welcome to Daily Recipes! Would you like to see the recipes of the day? (yes / no)"

    input = nil
    until input == "yes" || input == "no"
      input = gets.strip.downcase
      if input == "yes"
        menu
      elsif input == "no"
        goodbye
      else
        puts "Sorry, not sure what you mean by that... Type 'yes' to see the menu of the day or 'no' to exit."
      end
    end
  end

  def menu
    daily_menu = DailyRecipes::Recipe.todays_recipes
    # this will get back a list of @@all the recipes in an array
    # it will then be responsible for iterating through that collection and printing a list of those options for the user
  end

  def goodbye
    puts "Thank you for using Daily Recipes! Hope to see you again soon for more delicious dishes."
  end

end
