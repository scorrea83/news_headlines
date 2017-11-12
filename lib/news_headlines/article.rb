class NewsHeadlines::Article
  attr_accessor :title, :author, :news_source, :description, :url, :published_at
  @@all = []

  def initialize(title = nil, author = nil, description = nil, url = nil, published_at = "unavailable")
    @title = title
    @author = author
    @description = description
    @url = url
    @published_at = published_at
    @@all << self
  end

  def self.new_from_json(article)
    self.new(
      article["title"],
      article["author"],
      article["description"],
      article["url"],
      article["publishedAt"]
    )
  end

  def self.find_article(article_title)
    self.all.find {|article| article.title == article_title}
  end

  def add_news_source(news_source)
    @news_source = news_source
  end

  def self.all
    @@all
  end


end
