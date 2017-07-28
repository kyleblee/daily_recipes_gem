class DailyRecipes::CLI

  def start
    puts "Welcome to Daily Recipes! Would you like to see the recipes of the day? (yes / no)"

    input = nil
    until input == "yes" || input == "no"
      input = gets.strip.downcase
      if input == "yes"
        menu
        choice
      elsif input == "no"
        goodbye
      else
        puts "Sorry, not sure what you mean by that... Type 'yes' to see the menu of the day or 'no' to exit."
      end
    end
  end

  def menu
    puts "******** Recipes of the Day ********"

    # gets back a list of @@all the recipes for the day, in an array
    daily_menu = DailyRecipes::Recipe.todays_recipes

    # then, take that collection of daily recipes and puts them in an ordered list for the user to choose from
    daily_menu.each.with_index(1) do |recipe, index|
      puts "#{index}. #{recipe.title}"
    end
  end

  def choice
    puts
    puts "Would you like to learn more about one of these recipes? Enter the number of the recipe you are interested in, or type 'exit'."

    recipe_num = nil
    until recipe_num != nil
      recipe_num = gets.strip
      if recipe_num == 'exit'
        goodbye
      elsif recipe_num.to_i > 0
        detailed_recipe = DailyRecipes::Recipe.recipe_description_card(recipe_num.to_i)
        print_recipe(detailed_recipe)
        full_directions?
      else
        puts "I'm sorry... I didn't understand that. Please type the number of the recipe you would like to learn more about, or type 'exit'."
        recipe_num = nil # make sure this doesn't create an infinite loop... It shouldn't.
      end
    end
  end

  def print_recipe(recipe)
    puts
    puts recipe.title
    puts
    puts recipe.description
    puts
    puts "--INGREDIENTS--"
    recipe.ingredients.each {|ingredient| puts ingredient}
  end

  def goodbye
    puts "Thank you for using Daily Recipes! Hope to see you again soon for more delicious dishes."
  end

end
