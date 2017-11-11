#cli should
# => Greet user
# #display list of news source categories
# Capture user input (get.strip.downcase)
# If/else statements
#  "Type the name of the news source to view list of latest articles"
# #display list of article titles
# "Please select article number to display information"
# #display article information (Article object with attributes)
# Optional?  Open article url?
# system("open #{@newsletter.articles[input.to_i-1].url}")
class NewsHeadlines::CLI

  def call
    #NewsHeadlines::Api.make_news_sources??
    puts "Welcome to News Headlines!"
    puts "Here you can view the latest live headlines from many news sources from around the world!"
    puts ""
    menu
    goodbye
  end

  def menu
    puts "Now diplaying and running #menu method."
    puts "To begin, select from the following news source categories.  Type the number of the category you wish to select."
    list_categories
    input = nil
    input = gets.strip.to_i

    #list sources for selected category
    # => list_sources(input)

  end

  def list_categories
    NewsHeadlines::Source::CATEGORIES.each.with_index(1) { |category, index| puts "#{index}. #{category}"}
  end

  def list_sources(input)
    category = NewsHeadlines::Source::CATEGORIES[input - 1]
    NewsHeadlines::Source.find_by_category(category).each.with_index(1) do |news_source, index|
      puts "#{index}. #{news_source.name}"
    end
  end


  def goodbye
    puts "Now displaying and running #goodbye method."
  end

end
#   NewsHeadlines::CLI.new.call
