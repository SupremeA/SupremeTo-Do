require 'faker'

# Create Users
5.times do
  user = User.new(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Lorem.characters(9)
  )
  user.skip_confirmation!
  user.save!
end
users= User.all

#Create List
5.times do
  List.create!(
    title: Faker::Lorem.sentence
  )
end
list = List.all

#Create Task
30.times do
  Task.create!(
    list: list.sample,
    title: Faker::Lorem.sentence,
    body: Faker::Lorem.paragraph
  )
end

user = User.first
user.skip_reconfirmation!
user.update_attributes!(
email: 'supreme036@gmail.com',
password: '12345678'
)

puts "Seed finished"
puts "#{User.count} Users created"
puts "#{List.count} lists created"
puts "#{Task.count} tasks created"
