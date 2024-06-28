class Book < ApplicationRecord
    has_and_belongs_to_many :villain, join_table: :book_villains
end
