require 'httparty'

class BooksService
  include HTTParty
  base_uri 'https://stephen-king-api.onrender.com/api'

  def self.fetch_books
    response = get('/books')
    if response.success?
      JSON.parse(response.body)
    else
      raise "Failed to fetch books: #{response.message}"
    end
  end
end
