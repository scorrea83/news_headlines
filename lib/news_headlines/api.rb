class NewsHeadlines::Api

  def self.get_sources
    doc = RestClient.get('https://newsapi.org/v1/sources?language=en')
    sources = JSON.parse(doc)
    sources["sources"]
  end

  def self.make_news_sources
    # Should this be called at the beginning when CLI launches?
    # => Might be overkill since user not likely to view all sources and articles and this would be unnecessary work?
    # Might be better to be called once user selects source.
    self.get_sources.each do |news_source|
      NewsHeadlines::Source.new_from_json(news_source)
      #add a line to #make_articles?
    end
  end

  def self.make_articles(news_source)
    #Called by CLI when user selects source to view articles for.
    #argument is a Source object
    #ToDo: change apiKey to some kind of module/class/something constant
    doc = RestClient.get("https://newsapi.org/v1/articles?source=#{news_source.id}&apiKey=dfdb90ce65d34e188575203af7c109f8")
    articles = JSON.parse(doc)
    articles["articles"].each do |article_hash|
      article = NewsHeadlines::Article.new_from_json(article_hash)
      article.add_news_source(news_source)
      binding.pry
    end
  end

end

# sources = NewsHeadlines::Api.make_news_sources
# cnn = NewsHeadlines::Source.all.find {|source| source.id == "cnn"}
# NewsHeadlines::Api.make_articles(cnn)
