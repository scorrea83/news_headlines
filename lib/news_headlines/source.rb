class NewsHeadlines::Source
  attr_accessor :name, :description, :country, :category, :url, :articles, :id
  @@all = []

  #TOdo Deal with @articles.  needs to be set to empty [] during instantiation to then be able to add artiles as they are created.

  def self.new_from_json(source)
    self.new(
      source["name"],
      source["description"],
      source["country"],
      source["category"],
      source["url"],
      source["id"]
    )
  end
  #thought of incorporating directly into #initialize but realized this is more flexible, allows for future use of this class to create sources from different non-api data sources?


  def initialize(name = nil, description = nil, country = nil, category = nil, url = nil, id = nil)
    @name = name
    @description = description
    @country = country
    @category = category
    @url = url
    @id = id
    @articles = []
    @@all << self
  end
  #refactor:attempt to use mass assignment(use source hash info)

  def self.all
    @@all
  end

  def add_article(article)
    @articles << article
  end

end

puts "Ruby is reading Source.rb"
