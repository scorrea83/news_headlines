class NewsHeadlines::Article
  attr_accessor :title, :author, :news_source, :description, :url, :published_at
  @@all = []

  def initialize(title = nil, author = nil, description = nil, url = nil, published_at = nil)
    @title = title
    @author = author
    @description = description
    @url = url
    @published_at = published_at
    @@all << self
  end
  #FIX: news_source needs to be Source object, maybe create a #add_source method that can then be called at the same time the article object is being created in the API.make_articles method?
  def self.new_from_json(article)
    self.new(
      article["title"],
      article["author"],
      article["description"],
      article["url"],
      article["published_at"]
    )
  end

end
