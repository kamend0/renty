# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

require 'faker'

# Define a hash to map cities to their respective states
city_state_map = {
  "New York" => "NY",
  "New Orleans" => "LA",
  "Los Angeles" => "CA",
  "Chicago" => "IL",
  "San Francisco" => "CA"
}

# Create 20 properties
200.times do
  city, state = city_state_map.to_a.sample
  
  property = Property.create!(
    address: Faker::Address.street_address,
    city: city,
    state: state
  )

  # Create a random number of units (between 1 and 5) for each property
  rand(1..8).times do
    Unit.create!(
      property_id: property.id,
      bedroom_count: rand(1..4),
      bathroom_count: rand(1..3),
      square_footage: rand(500..2000),
      rent_price: Faker::Number.decimal(l_digits: 4, r_digits: 2) # e.g., 1500.00
    )
  end
end

puts "Seeded #{Property.count} properties and #{Unit.count} units."
