class VillainsService
    include HTTParty
    base_uri 'https://stephen-king-api.onrender.com/api' 
  
    def self.fetch_villains
      response = get('/villains') 
      if response.success?
        JSON.parse(response.body)  
      else
        raise StandardError, "Failed to fetch villains: #{response.code}"
      end
    end
  end
  