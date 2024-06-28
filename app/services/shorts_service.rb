  class ShortsService
    include HTTParty
    base_uri 'https://stephen-king-api.onrender.com/api'  
  
    def self.fetch_shorts
      response = get('/shorts')  
      if response.success?
        JSON.parse(response.body)  
      else
        raise StandardError, "Failed to fetch shorts: #{response.code}"
      end
    end
  end
  