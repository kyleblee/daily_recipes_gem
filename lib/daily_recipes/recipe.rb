class DailyRecipes::Recipe
  attr_accessor :title, :description, :cook_time, :url

  @@all = []

  def initialize

  end

  def self.todays_recipes
    scrape_allrecipes_website
    scrape_recipe_website
    scrape_seriouseats_website
    self.all
  end

  def self.scrape_allrecipes_website

  end

  def recipe_card
    #returns a recipe card of the recipe that the user chooses, which will contain the recipes: title,
    # a brief description, total cook time, and the url for hte full recipe instructions.
  end

  def save
    @@all << self
  end
end
