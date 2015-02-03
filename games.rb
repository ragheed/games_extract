require 'open-uri'
require 'nokogiri'

class Games
  def initialize
    #site seems to reject clients without user-agent
    @agent = 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2227.0 Safari/537.36'
    
    #url is slightely modified to ensure metascore page retrieval (in case default site behaviour is changed)
    @page = Nokogiri::HTML(open('http://www.metacritic.com/game/playstation-3?topgames-sort=metascore', 'User-Agent' => @agent))

    #enumrable with list of children
    @elements = @page.css('ol.list_products.list_product_summaries li.product')
  end

  #return hash with all games,scores extracted
  def get_all
    result = Array.new
    #adding value hash to array
    @elements.each do |element|
      result.push ({
        'title' => element.css('h3.product_title a').text ,
        'score' => element.css('span.metascore_w').text.to_i
      })
    end
    #return value
    result
  end

  #return Hash of searched game, nil if not found
  # @PARAM: name
  def get_game (name)
    @elements.each do |element|
      #return desired game if found
      if element.css('h3.product_title a').text == name
        return {
          'title' => element.css('h3.product_title a').text ,
          'score' => element.css('span.metascore_w').text.to_i
        }
      end
    end
    #return nil if game is not found
    return nil
  end

end
