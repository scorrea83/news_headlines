class NewsHeadlines::Source
  attr_accessor :name, :description, :country, :category, :articles

  def initialize(name = nil, description = nil, country = nil, category = nil)
    @name = name
    @description = description
    @country = country
    @category = category
  end

end

puts "Ruby is reading Source.rb"
