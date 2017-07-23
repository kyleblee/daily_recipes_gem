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
  - Specify your gem's dependencies in daily_recipes.gemspec. It's also best practice to specify all the gems that our library depends on in the gemspec.
  - Use daily_recipes.rb as the environment file of your project.
  - Create a video demo (with narration!) describing how a user would interact with your working gem.
  - Write a blog post about the project and process, using the notes you took throughout development.

## A list of process and progress along the way to use on the blog post:
    - First, used "bundle gem daily_recipes" to automatically generate the project files. Then, created a remote git repository and hook it up to my local repository after making my first commit.
    - Once I had the file structure set up. I planned out the user flow of my CLI application in NOTES.md. The general gist was...(see PLANNING below and include in post)
    - Avi's "CLI Gem Walkthrough" video was a really helpful guide for starting to build. I created a "daily-recipes" file in the bin directory and added a shebang line. The file, for the time being, just puts-ed "You ready to eat some food, yo?", just so I could be sure it was working. Once I tested that, I created a CLI.rb file inside of my lib/daily_recipes directory for actually handling the user interaction of the program (the CLI controller) and created a class called #start that greets the user and gets the first input (whether or not they would like to see the recipes of the day).
    - When I tried running the daily-recipes executable, I got the 'uninitialized constant' error because my load dependencies weren't set up correctly. So, I continued to watch Avi's video and used that guidance to fix the dependencies in my program. I decided to use the lib/daily_recipes file as my environment, similar to what he does in the video.
    - Changed #start to #greeting, to be more descriptive. Then, I added conditional statements inside of #greeting so that "yes" presents a menu for them to choose from, "no" says a "goodbye" message and exits the program, and anything else calls #greeting again until "yes" or "no" is entered. I also used #downcase so that if the user types any uppercase letters, the program shouldn't break.

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
