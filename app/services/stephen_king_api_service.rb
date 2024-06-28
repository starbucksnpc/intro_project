require 'httparty'

class StephenKingApiService
  BASE_URL = "https://stephen-king-api.onrender.com/api"

  def self.fetch_books
    url = URI.parse("#{BASE_URL}/books")
    response = Net::HTTP.get_response(url)
    JSON.parse(response.body)["data"]
  end

  def self.fetch_shorts
    url = URI.parse("#{BASE_URL}/shorts")
    response = Net::HTTP.get_response(url)
    JSON.parse(response.body)["data"]
  end

  def self.fetch_villains
    url = URI.parse("#{BASE_URL}/villains")
    response = Net::HTTP.get_response(url)
    JSON.parse(response.body)["data"]
  end
end
