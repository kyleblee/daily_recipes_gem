class DailyRecipes::CLI

  def greeting
    puts "Welcome to Daily Recipes! Would you like to see the recipes of the day? (yes / no)"
    input = gets.strip.downcase
    if input == "yes"
      menu
    elsif input == "no"
      goodbye
    else
      greeting
    end
  end

  def menu
    puts "made it!"
  end

  def goodbye
    puts "Thank you for using Daily Recipes! Hope to see you again soon for more delicious dishes."
  end

end
