# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!([{
                    username: "Avalon",
                    name: "marcelito",
                    email: "test@test.com",
                    description: Faker::Hacker.say_something_smart,
                    password: "123456",
                    password_confirmation: "123456",
                    residence: Faker::Address.city,
                    role: "natural"
                }])

4.times do

  User.create!([{
                    username: Faker::Internet.username(6),
                    name: Faker::Name.first_name,
                    email: Faker::Internet.email,
                    description: Faker::Hacker.say_something_smart,
                    password: "123456",
                    password_confirmation: "123456",
                    residence: Faker::Address.city,
                    role: "natural"
                }])
                
end
  
for i in 1..5 do
  5.times do
  Product.create!([{
                       name: Faker::Commerce.product_name,
                       description: Faker::Commerce.department,
                       price: Faker::Commerce.price,
                       quantity: 1,
                       kind: "Pant",
                       gender: "Men",
                       state: 1,
                       new: 0,
                       user_id: i
                   }])
  end
end
      
      
5.times do
  Tag.create!([{
                name: Faker::Games::Pokemon.name
              }])

  Rating.create!([{
                  comment: Faker::Hacker.say_something_smart,
                  rating: Faker::Number.between(0, 5)
                }])            

  Image.create!([{
                  name: "#{Faker::Games::Pokemon.name}.#{Faker::File.extension}"
                }])


  Message.create!([{
                  text: Faker::Games::WorldOfWarcraft.quote
                  }])

  Report.create!([{
                  body: Faker::Hacker.say_something_smart
                }])

end

for i in 1..25 do
  productos = Product.find_by(id: i)
  productos.tags << Tag.find_by(id: Faker::Number.between(1, 5))
end
