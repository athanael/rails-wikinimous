# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
require 'faker'

puts 'Cleaning database...'
Article.destroy_all
puts 'All the article are destroyed'

puts 'Creating 10 articles...'
10.times do |n|
  n = Article.new(title: Faker::Book.unique.title, content: Faker::Lorem.paragraphs(number: 5).join("\n\n"))
  n.save
  puts "New article #{n.title} created"
end

puts "All the articles are created"
