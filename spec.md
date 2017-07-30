# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
    - CLI interface created. User interacts with the program with simple commands like "menu", "more", a number of the recipe they are interested in, and "exit".
    - Have implemented responses and loops to accommodate unexpected input from the user.
- [x] Pull data from an external source
    - The application pulls data from three different websites (allrecipes.com, seriouseats.com, and delish.com); using both their "recipe list" pages, as well as specific recipe pages (6 webpages total).
- [x] Implement both list and detail views
    - "menu" brings up the list view
    - the user can then enter the number of a recipe they are interested in to bring up that recipe's detail view
    - the user can also type "more" when in a detail view in order to be taken to the full recipe in their default browser
