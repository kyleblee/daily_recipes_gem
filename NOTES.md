## List of things to accomplish:
  <!-- - CONNECT YOUR LOCAL REPO TO A GITHUB REPO -->
  - Make sure you are committing OFTEN! (every 3-7 minutes / less than 15 lines of code per commit)
  - Track your thoughts, stumbles, and fixes as you go so you have plenty of content for the blog post.
  - If you have any questions along the way, DON'T use the "Ask New Question" feature. Instead, reach out to your Learn Instructor for this section.
  - Create a console so that you have a sandbox to play in.
  - Short description on what the gem is for in the README.md file
  - Final instructions to the user on how to install, run, and use the gem. Use the examples
  in the lab instructions as a guide for this (in the README.md file)
  - Add all of the necessary information to the gemspec file (the TODO's) once you have completed the program and know exactly what it will do.
  - Use the "string".to_i equals 0 trick that Avi uses as a way of checking to be sure the user entered an integer when they were prompted to choose a recipe for more information.
  - Use #each.with_index(1) when creating your list so you don't have to use input - 1 the entire time.
  - Specify your gem's dependencies in daily_recipes.gemspec. It's also best practice to specify all the gems that our library depends on in the gemspec.
  - Use daily_recipes.rb as the environment file of your project.
  - Create a video demo (with narration!) describing how a user would interact with your working gem.
  - Write a blog post about the project and process, using the notes you took throughout development.

## A list of process and progress along the way to use on the blog post:
    - First, used "bundle gem daily_recipes" to automatically generate the project files. Then, created a remote git repository and hook it up to my local repository after making my first commit.
    - Once I had the file structure set up. I planned out the user flow of my CLI application in NOTES.md. The general gist was...(see PLANNING below and include in post)
    - Avi's "CLI Gem Walkthrough" video was a really helpful guide for starting to build. I created a "daily-recipes" file in the bin directory and added a shebang line. The file, for the time being, just puts-ed "You ready to eat some food, yo?", just so I could be sure it was working. Once I tested that, I created a CLI.rb file inside of my lib/daily_recipes directory for actually handling the user interaction of the program (the CLI controller) and created a class called #start that greets the user and gets the first input (whether or not they would like to see the recipes of the day).
    - When I tried running the daily-recipes executable, I got the 'uninitialized constant' error because my load dependencies weren't set up correctly. So, I continued to watch Avi's video and used that guidance to fix the dependencies in my program. I decided to use the lib/daily_recipes file as my environment, similar to what he does in the video.
    - Changed #start to #greeting, to be more descriptive. Then, I added conditional statements inside of #greeting so that "yes" presents a menu for them to choose from, "no" says a "goodbye" message and exits the program, and anything else calls #greeting again until "yes" or "no" is entered. I also used #downcase so that if the user types any uppercase letters, the program shouldn't break. Went back and added an until loop, so that I can give a "not sure what you meant" message for unexpected inputs and then prompt the user for input again.
    - Next, I defined a class called "recipe" in a file called "recipe.rb" that will be responsible for creating new recipes. When thinking about it, I also decided that this class should be responsible for returning a list of recipes for the day, as well as giving more detail on the specific recipe that the user is interested in learning more about.
    - I had forgotten to add pry earlier, so I added it to the gemspec file and my environment file, as well. I'm still not entirely sure how Avi required dependencies in the video when he used the console file...
    - At this point, I am ready to start scraping the three sites that I will be pulling recipes from. But, in order for me to start building that, I need to add the Nokogiri and OpenURI dependencies to my gemspec file and environment.
    - So I am going to start with allrecipes.com as the first site that I scrape from, and I'll be building the #scrape_allrecipes_website method. First I need to use Nokogiri::HTML and OpenURI to define a "doc" variable that I can use to start searching through. To find out what selectors grab the site_recipes, I used Chrome's Inspect Element feature and binding.pry so that I could play around until I found the correct selector. Once I found the correct selector for each recipe element ("#grid .grid-col--fixed-tiles") I decided to include a conditional statement inside of the #each_with_index iterator that only creates a new recipe if the index is less than 4. I realize this was a pattern that Avi advised against using in his anti-patterns... but there are a ton of recipes on these sites and I'd rather just give 5 from each one (right from the beginning) to keep the program faster and simpler to use.
    - Once I got the correct selector for the title, I ran into a problem to solve... The selector that all of the recipe grids are using is also being used by advertisements / marketing. The problem is that the h3's in these grids return an empty string (and we aren't interested in them anyways because they aren't a recipe). There are two ways for me to solve this: include them anyways in the initial collection and remove them later, or figure out a way to filter them out now using another conditional statement. I decided to go with the second option, because adding them anyways and then removing them will cause the program to be slower. I've noticed that these advertisements also have additional classes in their selectors such as "marketing-card" or "gridad". So I'll try to make local variables that evaluate to true or false, depending on whether or not the selector contains "marketing-card" or "gridad" when attr("class") is called on them. On second thought, I'll use a higher level enumerator like #reject to remove these elements from the collection of recipe article elements before we even start iterating through them with #each_with_index; this will also just look a lot nicer than a conditional statement.



## PLANNING
    - What is the gem: A CLI application that scrapes the latest recipes on the homepages of allrecipes.com, recipe.com, and seriouseats.com, and presents them to the user so they can choose a recipe and get more information.
    - USER FLOW
      - User types in "daily-recipes"
      - A #greeting appears followed by the prompt "Would you like to see the recipes of the day?" ("yes" / "exit")
      - "yes" brings up 15 recipe titles (5 from each site) in a numbered list
      - another prompt asks the user if they would like to see more information on any of the recipes (allowing the user to choose by typing the number associated with the recipe title)
      - If they choose a recipe title, they are shown the following information on that recipe:
        - the recipe title
        - a description
        - total prep / cook time
      - Another prompt asks them if they would like to see the full recipe, return to the recipe list, or exit the program.
        - if they choose to see the full recipe, the URL for that recipe is opened in the user's default browser
        - if they choose to return to the list, the recipe list is shown again with the SAME recipes
        - if they choose to exit the program, the program ends
      - So I'll need a recipe object that contains the following attributes:
        - a title
        - a description
        - a total cook/prep time
        - a URL for the full recipe
      - All recipes that are created should be added to a recipe class variable of @@all, so that I can use that collection to present the menu to the user using #each and also give more information if they choose to see more.
