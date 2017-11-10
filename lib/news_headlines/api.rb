class NewsHeadlines::Api

  def self.get_sources
    doc = RestClient.get('https://newsapi.org/v1/sources?language=en')
    sources = JSON.parse(doc)
    sources["sources"]
  end

  def self.make_news_sources
    self.get_sources.each do |news_source|
      NewsHeadlines::Source.new_from_json(news_source)
      #add a line to #make_articles?
    end
  end

  def self.make_articles(news_source)
    #Called by CLI when user selects source to view articles for.
    #Needs to be "id" value of source,
    #ToDo: change apiKey to some kind of module/class/something constant
    doc = RestClient.get("https://newsapi.org/v1/articles?source=#{news_source}&apiKey=dfdb90ce65d34e188575203af7c109f8")
    articles = JSON.parse(doc)
    binding.pry
    articles["articles"].each do |article|
      NewsHeadlines::Article.new_from_json(article)
    end
  end


  #article creation method:
    # takes in argument of news source (id or name?)
    # uses RestClient and JSON to get and parse from newsapi the articles belonging to news source
    # sets above array to a local variable
    # iterates through local variable array sends each element/article to NewsHeadlines::Article with Article method to create Article objects from JSON (similar to Source.new_from_json)

end

#sources = NewsHeadlines::Api.make_news_sources
