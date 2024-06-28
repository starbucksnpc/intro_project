class Book < ApplicationRecord
    has_and_belongs_to_many :villain, join_table: :book_villains

      # Validations
  validates :title, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validates :pages, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end
