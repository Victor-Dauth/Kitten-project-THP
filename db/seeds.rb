# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.destroy_all

20.times do |id|
item = Item.create(title: Faker::Superhero.name, description: Faker::Lorem.sentence(word_count: 10), price: Faker::Number.decimal(l_digits: 2), image_url: "chaton_#{id}.jpg")
end

user = User.create(email: 'kitty-pic@yopmail.com', last_name: 'pic', first_name: 'kitty', password: '123456')