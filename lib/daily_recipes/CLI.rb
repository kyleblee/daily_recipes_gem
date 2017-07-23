class DailyRecipes::CLI

  def greeting
    puts "Welcome to Daily Recipes! Would you like to see the recipes of the day? (yes / no)"
    input = gets.strip.downcase
    menu if input == "yes"
  end

  def menu
    puts "made it!"
  end

end
