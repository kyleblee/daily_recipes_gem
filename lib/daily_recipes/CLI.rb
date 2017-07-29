class DailyRecipes::CLI

  def start
    puts "Welcome to Daily Recipes! Would you like to see the recipes of the day? (yes / no)"

    input = nil
    until input == "yes" || input == "no"
      input = gets.strip.downcase
      if input == "yes"
        menu
        chosen_recipe = choice
        full_directions?(chosen_recipe) unless chosen_recipe == nil
      elsif input == "no"
        goodbye
      else
        puts "Sorry, not sure what you mean by that... Type 'yes' to see the menu of the day or 'no' to exit."
      end
    end
  end

  def menu
    DailyRecipes::Recipe.todays_recipes
    print_menu
  end

  def print_menu
    puts
    puts "******** Recipes of the Day ********"
    puts
    DailyRecipes::Recipe.all.each.with_index(1) do |recipe, index|
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
      else
        puts "I'm sorry... I didn't understand that. Please type the number of the recipe you would like to learn more about, or type 'exit'."
        recipe_num = nil
      end
    end
    detailed_recipe
  end

  def print_recipe(recipe)
    puts
    puts "----#{recipe.title}----"
    puts
    puts recipe.description
    puts
    puts "--INGREDIENTS--"
    recipe.ingredients.each {|ingredient| puts ingredient}
  end

  def full_directions?(recipe)
    puts
    puts
    puts "Does it look yummy!? You can type 'more' to see the full recipe in-browser. You can also type 'menu' to see the daily menu again or type 'exit'."
    more_choice = nil
    until more_choice != nil
      more_choice = gets.strip.downcase
      if more_choice == 'more'
        puts "TAKE ME TO THE WEBPAGE!"
      elsif more_choice == 'menu'
        print_menu
        chosen_recipe = choice
        full_directions?(chosen_recipe) unless chosen_recipe == nil
      elsif more_choice == 'exit'
        goodbye
      else
        puts
        puts "I'm sorry... I didn't understand that. You can type 'more' to see the full recipe in-browser. You can also type 'menu' to see the daily menu again or type 'exit'."
        more_choice = nil
      end
    end
  end

  def goodbye
    puts
    puts "Thank you for using Daily Recipes! Hope to see you again soon for more delicious dishes."
  end

end
