# app/models/book.rb

class Book < ApplicationRecord
    has_and_belongs_to_many :villains, join_table: :book_villains
  
    validates :title, presence: true
    validates :year, presence: true, numericality: { only_integer: true, greater_than: 0 }
    validates :pages, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
    def fetch_villains_data_from_api
      response = HTTParty.get("https://stephen-king-api.onrender.com/api/villains?book_id=#{self.id}")
      if response.success?
        villains_data = response.parsed_response
        Rails.logger.debug("Fetched villains data: #{villains_data.inspect}")
        villains_data
      else
        Rails.logger.error("Failed to fetch villains data from API for book: #{self.id}")
        []
      end
    end
  
    def fetch_villains_from_api(villains_data)
      villains_data.each do |villain_data|
        Rails.logger.debug("Processing villain data: #{villain_data.inspect}")
        villain = Villain.find_or_initialize_by(url: villain_data['url'])
        if villain.new_record?
          response = HTTParty.get(villain_data['url'])
          if response.success?
            villain.attributes = response.parsed_response.slice("name", "gender", "status")
            villain.save
          else
            Rails.logger.error("Failed to fetch villain details from API: #{villain_data['url']}")
          end
        end
        self.villains << villain unless self.villains.include?(villain)
      end
    end
  end
  