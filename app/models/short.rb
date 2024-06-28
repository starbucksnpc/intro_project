class Short < ApplicationRecord
    has_and_belongs_to_many :villain, join_table: :short_villains
end
