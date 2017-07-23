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
    doc = Nokogiri::HTML(open("http://allrecipes.com/"))
    site_recipes = doc.css("#grid .grid-col--fixed-tiles")
    # recipe.attr("class")
    site_recipes.each_with_index do |recipe, index|
      if index < 5
        new_recipe = self.new
        new_recipe.title = recipe.css("h3.grid-col__h3.grid-col__h3--recipe-grid").text.strip
        binding.pry
        new_recipe.save
      end
    end
  end

  def recipe_card
    #returns a recipe card of the recipe that the user chooses, which will contain the recipes: title,
    # a brief description, total cook time, and the url for hte full recipe instructions.
  end

  def save
    @@all << self
  end
end
