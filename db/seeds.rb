# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
5.times do
  User.create!([{
                    username: Faker::Internet.username(6),
                    name: Faker::Name.first_name,
                    description: Faker::Hacker.say_something_smart,
                    password: Faker::Internet.password(3),
                    residence: Faker::Address.city,
                    role: "natural"
                }])

  Product.create!([{
                       name: Faker::Commerce.product_name,
                       description: Faker::Commerce.department,
                       price: Faker::Commerce.price,
                       quantity: 1,
                       kind: "Pant",
                       gender: "Men",
                       state: 1,
                       new: 0,
                       user_id: User.first.id

                   }])
end