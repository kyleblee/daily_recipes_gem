class DailyRecipes::Recipe
  attr_accessor :title, :description, :ingredients, :url

  @@all = []

  def initialize

  end

  def self.all
    @@all
  end

  def self.recipe_description_card(recipe_num)
    # recieves the recipe_num that the user is interested in learning more about
    chosen_recipe = self.all[recipe_num - 1]

    # uses the @url of that recipe object to determine which scraping method to use for additional details
    # and then returns that more robust recipe to be printed
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

    # to correct HTTP to HTTPS problem that was occuring? (not entirely sure what was happening here)
    corrected_link = URI.parse(recipe.url.gsub("https", "http")).to_s

    doc = Nokogiri::HTML(open(corrected_link))
    recipe.description = doc.css("section.recipe-summary div.submitter__description").text.strip.delete("/\\\"/")
    ingredients = doc.css("div.recipe-container-outer li.checkList__line span.recipe-ingred_txt")
    recipe.ingredients = []
    ingredients.each do |ingredient|
      recipe.ingredients << ingredient.text unless ingredient.attr("class").include?("white")
    end
    # because something seems to be getting added as an empty string for some reason.
    recipe.ingredients.delete_if {|ingredient| ingredient == ""}
    recipe
  end

  def self.scrape_delish_details(recipe)
    doc = Nokogiri::HTML(open(recipe.url))
    # index included to avoid advertisements that are placed in a second <p> element in some recipe descriptions.
    recipe.description = doc.css("div.recipe-page--body-content p")[0].text
    ingredients = doc.css("ul.recipe-ingredients-list li.recipe-ingredients-item")
    recipe.ingredients = []
    ingredients.each do |ingredient|
      recipe.ingredients << ingredient.text.strip
    end
    recipe
  end

  def self.scrape_seriouseats_details(recipe)
    doc = Nokogiri::HTML(open(recipe.url))
    recipe.description = doc.css("div#entry-text div.recipe-introduction-body p")[1].text
    ingredients = doc.css("div.recipe-ingredients ul li.ingredient")
    recipe.ingredients = []
    ingredients.each do |ingredient|
      recipe.ingredients << ingredient.text.strip
    end
    recipe
  end

  def save
    @@all << self
  end

  def self.sort_by_num_ingr

    self.all.each.with_index(1) do |r, i|
      recipe_description_card(i)
    end

    self.all.sort_by do |recipe1, recipe2|
      recipe2.ingredients.length <=> recipe1.ingredients.length
    end
  end
end
