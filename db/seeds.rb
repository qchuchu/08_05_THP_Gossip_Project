# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'pry'

DatabaseCleaner.clean_with(:truncation)

10.times do |i|
  address = Faker::Address
  City.create(city_name: address.city, zip_code: address.zip_code)
end

10.times do |i|
  first_name, last_name = Faker::FunnyName.two_word_name.split(' ')
  age = rand(18..77)
  email = Faker::Internet.email(name: "#{first_name} #{last_name}", separators: '.')
  city = City.all[i]
  description = "#{first_name} loves to #{Faker::Verb.base} in the nature with #{Faker::Superhero.name}."
  User.create(first_name: first_name, last_name: last_name, description: description, email: email, age: age, city: city)
end

10.times do |i|
  gossips = []
  2.times do
    title = Faker::Hipster.sentence(word_count: 4)
    content = Faker::Hipster.paragraph
    gossips << Gossip.create(title: title, content: content)
  end
  User.all[i].gossips.push(*gossips)
end

10.times do
  title = Faker::Hipster.word
  Tag.create(title: title)
end

Gossip.all.each do |gossip|
  num = rand(1..4)
  gossip.tags.push(*Tag.all.sample(num))
end

10.times do
  sender = User.all.sample
  recipients = User.all.sample(rand(1..4))
  content = Faker::Hipster.paragraph
  pvm = PrivateMessage.create(content: content, sender: sender)
  pvm.recipients << recipients
end
