# Specifications for the CLI Assessment

Specs:
- [x] Have a CLI for interfacing with the application
      => I built a NewsHeadlines::CLI class that is responsible for instantiating a CLI object. This CLI class instance methods  collaborate with Source and Article objects, and the Api class to expose their data/behavior to a user through the #call and #menu methods. The news_headlines application executable file simply instantiates and #call(s) a new NewsHeadlines::CLI object to access this interface.
- [X] Pull data from an external source
      => I accomplish this with the Api class. This class has a couple of methods that use RestClient.get to send http requests to NewsAPI to get data on both news sources and article headlines.
- [X] Implement both list and detail views
      => Accomplished by the CLI #menu method.  Data from the News API is exposed to the user through this method three levels deep.  The first list presented shows news source categories, the second list includes news source objects, and the third presents a list of article objects belonging to the chosen news source. Finally, 3 levels deep, details of the article object chosen from the previous list are presented to the user.
