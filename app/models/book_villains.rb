class BookVillains < ApplicationRecord
    belongs_to :book
    belongs_to :villain
  end