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

10.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    created_at: Faker::Date.between(from: 2.days.ago, to: Date.today),
    updated_at: Faker::Date.between(from: Date.today, to: 1.day.after)
  )
end

puts "Users created"

10.times do
  Message.create(
    user_id: User.all.sample.id,
    content: Faker::Lorem.sentence,
    created_at: Faker::Date.between(from: 2.days.ago, to: Date.today),
    updated_at: Faker::Date.between(from: Date.today, to: 1.day.after)
  )
end

puts "Messages created"

10.times do
  Appointment.create(
    user_id: User.all.sample.id,
    date: Faker::Date.between(from: 2.days.ago, to: Date.today),
    created_at: Faker::Date.between(from: 2.days.ago, to: Date.today),
    updated_at: Faker::Date.between(from: Date.today, to: 1.day.after)
  )
end

puts "Appointments created"