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
    # input = nil
  end

  def list_categories
    categories = ["business", "entertainment", "gaming", "general", "music", "politics", "science-and-nature", "sport", "technology"]
    categories.each.with_index(1) { |category, index| puts "#{index}. #{category}"}
  end

  def goodbye
    puts "Now displaying and running #goodbye method."
  end

end
#   NewsHeadlines::CLI.new.call
