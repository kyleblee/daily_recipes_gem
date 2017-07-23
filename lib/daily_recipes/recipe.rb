class DailyRecipes::Recipe
  attr_accessor :title, :description, :cook_time, :url

  @@all = []

  def initialize

  end

  def self.all
    @@all
  end

  def self.todays_recipes
    scrape_allrecipes_website
    scrape_recipe_website
    scrape_seriouseats_website
    self.all
  end

  def self.scrape_allrecipes_website
    # getting all of the recipe articles on homepage and removing the marketing / advertisting ones
    doc = Nokogiri::HTML(open("http://allrecipes.com/"))
    site_recipes = doc.css("#grid .grid-col--fixed-tiles").reject do |recipe|
      recipe.attr("class").include?("gridad") || recipe.attr("class").include?("marketing-card")
    end

    # iterating through the recipes, creating new recipe objects, adding them to the @@all class variable, and
    # and returning the @@all variable at the end
    site_recipes.each_with_index do |recipe, index|
      if index < 5
        new_recipe = self.new
        new_recipe.title = recipe.css("h3.grid-col__h3.grid-col__h3--recipe-grid").text.strip
        new_recipe.url = "https://allrecipes.com#{recipe.css("a").attr("href").value}"
        new_recipe.save
      end
    end
    self.all
  end

  ######### >>>>> FINISHED THE FIRST SCRAPE MEHTOD (ABOVE), NOW TO TAKE THAT SAME LOGIC AND APPLY IT TO THE OTHER SCRAPING METHODS. THEN, ONCE ALL ARE SCRAPED, @@ALL NEEDS TO BE RETURNED / USED FOR THE INITIAL MENU)

  def recipe_card
    #returns a recipe card of the recipe that the user chooses, which will contain the recipes: title,
    # a brief description, total cook time, and the url for hte full recipe instructions.
  end

  def save
    @@all << self
  end
end
