class DailyRecipes::Recipe
  attr_accessor :title, :description, :cook_time, :url

  @@all = []

  def initialize

  end

  def self.todays_recipes
    binding.pry
    # creates recipes using a separate scrape method for each site and places these recipes in the @@all class variable
    # then, returns the collection in @@all for the #menu method to use for printing out a menu
    puts "boom boom diggity"
  end

  def recipe_card
    #returns a recipe card of the recipe that the user chooses, which will contain the recipes: title,
    # a brief description, total cook time, and the url for hte full recipe instructions.
  end
end
