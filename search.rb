require('rest-client')

class Bingsearch

  def initialize(url ,query)
    @data = RestClient.get(url, {:params => {:q => query}})
  end
  def show_links
     splitted = @data.body.split('class="b_algo"><h2><a href="').drop(1)
     result = splitted.map {|link| link.split('" ')[0]}
     puts result
  end
end
url = 'https://www.bing.com/search'
query = 'bread'
search = Bingsearch.new(url,query)
search.show_links
