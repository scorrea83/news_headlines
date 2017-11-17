# NewsHeadlines

Welcome to NewsHeadlines! NewsHeadlines is a Ruby CLI gem that gives you access to the latest news headlines for 60 major news sources and blogs from around the world. NewsHeadlines accesses the NewsAPI (https://newsapi.org/) and presents this information to the user through a CLI.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'news_headlines'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install news_headlines

## Usage

### API Key
Before running, the you must first change the API_KEY constant found in news_headlines/lib/news_headlines.rb file. Replace the string `"Your NewsAPI key goes here"` with a string containing your NewsAPI key and save the changes to the file.

```ruby
module NewsHeadlines

API_KEY = "Your NewsAPI key goes here."

end
```

A NewsAPI key can be obtained for free from NewsAPI at (https://newsapi.org/). NewsAPI does require one to register under a free account and to agree to the terms of use.

```ruby
require 'news_headlines'

news_headlines #runs the CLI
```
Once run, the CLI will present the user with a list of news source categories to choose from.  Once selected, the user is presented with a list of news sources matching the category.  Here the user can select a news source to view its latest headlines.  Next the user can choose from a list of news headlines to view more details on a specific headline. At this point the user can choose to begin the process again or exit the application.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'correasergio-78803'/news_headlines. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
