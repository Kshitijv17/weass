# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# pro=Product.all
# use=User.all
# use.each do |u|
#     pro.each do |p|
#         if u.id=p.user_id
#         order =Order.create(
#             user_id: 
#             product_id: 
#        )
#     end
# end

# Clear existing records
User.destroy_all
Product.destroy_all
Order.destroy_all

# Create 10 users
10.times do |i|
  User.create(
    name: "User #{i + 1}",
    email: "user#{i + 1}@example.com",
    phno: "123456789#{i}" # Just a simple phone number pattern
  )
end

# Create 1 product per user
User.find_each do |user|
  Product.create(
    product_name: "Product for #{user.name}",
    user: user
  )
end

# Create 1 order for each product
Product.find_each do |product|
  Order.create(
    user: User.order("RANDOM()").first, # Random user
    product: product
  )
end

puts "Seeded #{User.count} users, #{Product.count} products, and #{Order.count} orders."
