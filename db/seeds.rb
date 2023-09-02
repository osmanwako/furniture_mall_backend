# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

users = User.all

for s in 1..6
  furniture = Furniture.create(name: "Sofa #{rand(1000)}", serial_number: "FT00#{rand(1000)}", description: "Furniture Description", upfront_price: "#{rand(100)}", total_price: "#{rand(100)}", warranty_year: "#{rand(100)}", user: users[rand(0..users.length - 1)])
end
furnitures = Furniture.all
for s in 1..6
  appointment = Appointment.create(appoint_date: "#{rand(100)}", total_price: "#{rand(1000)}", discount_price: "#{rand(100)}", furniture: furnitures[rand(0..furnitures.length - 1)], customer: users[rand(0..users.length - 1)])
end
