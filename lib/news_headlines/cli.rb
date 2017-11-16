class NewsHeadlines::CLI

  attr_accessor :source_list, :article_list

  def call
    clear_attributes
    NewsHeadlines::Api.make_news_sources
    puts "---------------------------------------------------------------------"
    puts "Welcome to News Headlines!"
    puts "Here you can view the latest live headlines from many news sources from around the world!"
    puts ""
    menu
    clear_attributes
    goodbye
  end

  def menu
    self.clear_attributes
    input = nil
    puts "To begin, select from the following news source categories."
    puts ""
    puts "---------------------"
    list_categories
    puts "---------------------"

    while input != "exit"
      puts "Enter the number of the category whose news sources you wish to view or type 'exit'."
      input = gets.strip.downcase
      puts ""
      if (1..NewsHeadlines::Source::CATEGORIES.size).include?(input.to_i)
        puts "---------------------"
        puts "#{NewsHeadlines::Source::CATEGORIES[input.to_i - 1].upcase} News Sources"
        list_sources(input.to_i)
        puts "---------------------"
        while input != "exit"
          puts "Enter the number of the news source whose headlines you wish to view or type 'exit'."
          input = gets.strip.downcase
          puts ""

          if (1..@source_list.size).include?(input.to_i)
            puts "---------------------"
            puts "#{@source_list[input.to_i - 1 ].name} Latest Headlines"
            list_articles(input.to_i)
            puts "---------------------"
            while input != "exit"
              puts "To view more information enter the headline number."
              puts "To return to the start, type 'menu'."
              puts "To quit, type 'exit'."

              input = gets.strip.downcase
              if (1..@article_list.size).include?(input.to_i)
                article_details(input.to_i)

              elsif input == "menu"
                self.clear_attributes
                self.menu
              end
            end
          end
        end
      end
    end
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
    NewsHeadlines::Api.make_articles(news_source)
    @article_list = news_source.articles
    @article_list.each.with_index(1) do |article, index|
      puts "#{index}. #{article.title}"
    end
  end

  def article_details(input)
    article = @article_list[input - 1]
    puts ""
    puts "---------------------------------------------------------------"
    puts ""
    puts "Title:           #{article.title}"
    puts "Author:          #{article.author}"
    puts "Url:             #{article.url}"
    puts "Published at:    #{article.published_at}"
    puts ""
    puts "-----------------Summary---------------------------------------"
    puts ""
    puts "#{article.description}"
    puts ""
    puts "---------------------------------------------------------------"
  end

  def clear_attributes
    @source_list = []
    @article_list = []
  end

  def goodbye
    puts "---------------------------------------------------------------"
    puts "Have a good day and come back for more news headlines!"
    puts "---------------------------------------------------------------"
  end

end
