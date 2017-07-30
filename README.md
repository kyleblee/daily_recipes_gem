# DailyRecipes

Searching for a recipe can be overwhelming. With seemingly hundreds of websites and cookbooks to look through, it can be hard to make a quick decision on what you want to make for a tasty personal or family meal. To avoid this, people frequently resort to making the same recipes, over and over again; sacrificing spontaneity for convenience. It's time for a solution.

Welcome to Daily Recipes! Your new, handy-dandy CLI application for receiving a short, digestible list of recipes every day. At the perfect intersection of simplicity and laziness, Daily Recipes makes it easy to choose from a short menu of dishes (scraped from three popular recipe sites), get more information on any that pique your interest, and even be taken to the full recipe in-browser. It is simple, easy to use and saves you from having to look through countless sites just to find one quick recipe.

Enjoy and happy cooking!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'daily_recipes'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install daily_recipes

## Usage

To use Daily Recipes, simply navigate to the root folder of the application and enter ./bin/daily-recipes into your command line. You can then follow the prompts to move around in the application and access the information you are interested in.

Note: from time to time, the program will throw a NoMethodError because of a nil value that is only sometimes returned from one of the websites. This rarely happens twice, so if it happens to you, simply run the program again and voila! In a later version, I will handle this error more elegantly. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kyleblee/daily_recipes. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
