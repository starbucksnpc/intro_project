class Villain < ApplicationRecord
    has_and_belongs_to_many :book, join_table: :book_villains
    has_and_belongs_to_many :short, join_table: :short_villains
end
