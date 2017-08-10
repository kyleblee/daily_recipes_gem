class DailyRecipes::Scraper

  def self.todays_recipes
    # scrapes each recipe site, creates Recipe instances with that information, and then returns @@all of the recipes
    scrape_allrecipes_website
    scrape_delish_website
    scrape_seriouseats_website
  end

  def self.scrape_allrecipes_website
    # getting all of the recipe articles from the homepage and removing the marketing / advertisting articles
    doc = Nokogiri::HTML(open("http://allrecipes.com/"))
    site_recipes = doc.css("#grid .grid-col--fixed-tiles").reject do |recipe|
      recipe.attr("class").include?("gridad") || recipe.attr("class").include?("marketing-card")
    end

    # iterating through the recipe articles, creating new recipe objects, adding them to the @@all class variable, and
    # and returning the @@all variable at the end
    site_recipes[0..4].each do |recipe|
      new_recipe = DailyRecipes::Recipe.new
      new_recipe.title = recipe.css("h3.grid-col__h3.grid-col__h3--recipe-grid").text.strip
      new_recipe.url = "https://allrecipes.com#{recipe.css("a").attr("href").value}"
      new_recipe.save
    end
  end

  def self.scrape_delish_website
    doc = Nokogiri::HTML(open("http://www.delish.com/recipes/"))
    site_recipes = doc.css("div.special-landing--ad-block div.special-article")

    site_recipes.each_with_index do |recipe, index|
      if index < 5
        new_recipe = DailyRecipes::Recipe.new
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
        new_recipe = DailyRecipes::Recipe.new
        new_recipe.title = recipe.css("a.module__link h4.title").text.strip
        new_recipe.url = recipe.css("a.module__link").attr("href").value
        new_recipe.save
      end
    end
  end

end
