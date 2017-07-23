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
    puts "made it!"
  end

  def goodbye
    puts "Thank you for using Daily Recipes! Hope to see you again soon for more delicious dishes."
  end

end
