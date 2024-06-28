class Short < ApplicationRecord
    has_and_belongs_to_many :villain, join_table: :short_villains

     # Validations
  validates :title, presence: true
  validates :short_type, presence: true
  validates :handle, presence: true
  validates :year, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
