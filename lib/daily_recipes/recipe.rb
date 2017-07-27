class DailyRecipes::Recipe
  attr_accessor :title, :description, :ingredients, :url

  @@all = []

  def initialize

  end

  def self.all
    @@all
  end

  def self.todays_recipes
    scrape_allrecipes_website
    scrape_delish_website
    scrape_seriouseats_website
    self.all
  end

  def self.scrape_allrecipes_website
    # getting all of the recipe articles from the homepage and removing the marketing / advertisting articles
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

  def self.scrape_delish_website
    doc = Nokogiri::HTML(open("http://www.delish.com/recipes/"))
    site_recipes = doc.css("div.special-landing--ad-block div.special-article")

    site_recipes.each_with_index do |recipe, index|
      if index < 5
        new_recipe = self.new
        new_recipe.title = recipe.css("a.landing-feed--special-title").text
        new_recipe.url = "http://www.delish.com#{recipe.css("a.landing-feed--special-title").attr("href").value}"
        new_recipe.save
      end
    end
  end

  def self.scrape_seriouseats_website
    doc = Nokogiri::HTML(open("http://www.seriouseats.com/recipes"))
    site_recipes = doc.css("div.block__wrapper div.module div.module__wrapper")

    site_recipes.each_with_index do |recipe, index|
      if index < 5
        new_recipe = self.new
        new_recipe.title = recipe.css("a.module__link h4.title").text.strip
        new_recipe.url = recipe.css("a.module__link").attr("href").value
        new_recipe.save
      end
    end
  end

  def self.recipe_description_card(recipe_num)
    # recieves the recipe_num.to_i that the user is interested in learning more about
    chosen_recipe = self.all[recipe_num - 1]

    # uses the @url of that recipe object to determine which scraping method to use
    if chosen_recipe.url.include?("allrecipes")
      self.scrape_allrecipes_details(chosen_recipe)
    elsif chosen_recipe.url.include?("delish")
      self.scrape_delish_details(chosen_recipe)
    elsif chosen_recipe.url.include?("seriouseats")
      self.scrape_seriouseats_details(chosen_recipe)
    end
    chosen_recipe
  end

  def self.scrape_allrecipes_details(recipe)
    corrected_link = URI.parse(recipe.url.gsub("https", "http")).to_s
    doc = Nokogiri::HTML(open(corrected_link))
    recipe.description = doc.css("section.recipe-summary div.submitter__description").text.strip.delete("/\\\"/")
    ingredients = doc.css("div.recipe-container-outer li.checkList__line span.recipe-ingred_txt")
    recipe.ingredients = []
    ingredients.each do |ingredient|
      recipe.ingredients << ingredient.text unless ingredient.attr("class").include?("white")
    end
    recipe.ingredients.delete_if {|ingredient| ingredient == ""} # because something seems to be getting added as an empty string for some reason.
    recipe
    binding.pry
  end

  def self.scrape_delish_details(recipe)
    doc = Nokogiri::HTML(open(recipe.url))
    recipe.description = doc.css("div.recipe-page--body-content p")[0].text # index included to avoid advertisements that are placed in a second <p> element in some recipe descriptions.
    ingredients = doc.css("ul.recipe-ingredients-list li.recipe-ingredients-item")
    recipe.ingredients = []
    ingredients.each do |ingredient|
      recipe.ingredients << ingredient.text.strip
    end
    recipe
    binding.pry
  end

  def self.scrape_seriouseats_details(recipe)
    doc = Nokogiri::HTML(open(recipe.url))
    binding.pry
  end

  def save
    @@all << self
  end
end
