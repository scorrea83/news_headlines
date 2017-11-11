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

  attr_accessor :source_list, :article_list

  def call
    NewsHeadlines::Api.make_news_sources
    binding.pry
    puts "Welcome to News Headlines!"
    puts "Here you can view the latest live headlines from many news sources from around the world!"
    puts ""
    menu
    binding.pry
    goodbye
  end

  def menu
    input = nil
    puts "Now diplaying and running #menu method."
    puts "To begin, select from the following news source categories."
    puts ""
    list_categories
    puts "Type the number of the category whose news sources wish to view or type 'exit'."
    input = gets.to_i
    list_sources(input)
    puts "Type the number of the news source whose headlines you wish to view or type 'exit'."



  end

  def list_categories
    NewsHeadlines::Source::CATEGORIES.each.with_index(1) { |category, index| puts "#{index}. #{category}"}
  end

  def list_sources(input)
    category = NewsHeadlines::Source::CATEGORIES[input - 1]
    @source_list = NewsHeadlines::Source.find_by_category(category)
    @source_list.each.with_index(1) do |news_source, index|
      puts "#{index}. #{news_source.name}"
    end
  end

  def list_articles(input)
    news_source = @source_list[input -1 ]
    @article_list = NewsHeadlines::Api.make_articles(news_source)
    @article_list.each.with_index(1) do |article, index|
      puts "#{index}. #{article["title"]}"
    end
  end


  def goodbye
    puts "Now displaying and running #goodbye method."
  end

end
# NewsHeadlines::CLI.new.call
