class NewsHeadlines::Source
  attr_accessor :name, :description, :country, :category, :articles
  @@all = []

  def self.new_from_json(source)
    self.new(
      source["name"],
      source["description"],
      source["country"],
      source["category"],
    )
  end
  #thought of incorporating directly into #initialize but realized this is more flexible, allows for future use of this class to create sources from different non-api data sources?


  def initialize(name = nil, description = nil, country = nil, category = nil)
    @name = name
    @description = description
    @country = country
    @category = category
    @@all << self
  end
  #refactor:attempt to use mass assignment(use source hash info)

  def self.all
    @@all
  end

end

puts "Ruby is reading Source.rb"
#abc_news = NewsHeadlines::Source.new_from_json(abc_hash)
#newsweek = NewsHeadlines::Source.new(name = "Newsweek", description = nil, country = "US", category = "general")
# {"id"=>"abc-news-au",
#   "name"=>"ABC News (AU)",
#   "description"=> "Australia's most trusted source of local, national and world news. Comprehensive, independent, in-depth analysis, the latest business, sport, weather and more.",
#   "url"=>"http://www.abc.net.au/news",
#   "category"=>"general",
#   "language"=>"en",
#   "country"=>"au",
#   "urlsToLogos"=>
#    {"small"=>"",
#     "medium"=>"",
#     "large"=>""},
#   "sortBysAvailable"=>["top"]}
# hash = {
#   "name" => "Time"
#   "description" = nil
#   "country" = "US"
#   "category" = "general"
# }
