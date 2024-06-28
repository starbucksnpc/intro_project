# db/seeds.rb


def seed_books
  books_array = StephenKingApiService.fetch_books
  books_array.each do |book_data|
    Book.create!(
      year: book_data["Year"],
      title: book_data["Title"],
      pages: book_data["Pages"]
      # other attributes if needed
    )
  end
end

def seed_shorts
  shorts_array = StephenKingApiService.fetch_shorts
  shorts_array.each do |short_data|
    Short.create!(
      title: short_data["title"],
      short_type: short_data["type"],
      handle: short_data["handle"],
      year: short_data["year"]
      # other attributes if needed
    )
  end
end

def seed_villains
  villains_array = StephenKingApiService.fetch_villains
  villains_array.each do |villain_data|
    Villain.create!(
      name: villain_data["name"],
      gender: villain_data["gender"],
      status: villain_data["status"]
      # other attributes if needed
    )
  end
end

puts "Seeding books..."
seed_books
puts "Seeding shorts..."
seed_shorts
puts "Seeding villains..."
seed_villains
