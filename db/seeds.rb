# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

    customer = Customer.create!(first_name: "John", last_name: "Wick", email: "tea@gmail.com", address: "123 tea ave")
    tea = Tea.create!(tea_name: "Green Tea", description: "Lipton", temperature: 80, brew_time: 3)
    tea2 = Tea.create!(tea_name: "Oolong", description: "Japan's Finest", temperature: 68, brew_time: 5)
    subscription = customer.subscriptions.create!(tea: tea, sub_name: "Tea Boxes", price: 9.99, status: "active", frequency: "monthly")
    subscription2 = customer.subscriptions.create!(tea: tea2, sub_name: "Tea Bags", price: 5.99, status: "disabled", frequency: "yearly")