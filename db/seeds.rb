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
    title: Faker::Lorem.sentence,
    user_id: users.sample.id
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

admin = User.new(
name:  'Art da Admin',
email: 'supreme036@gmail.com',
password: '12345678',
role: 'admin'
)
admin.skip_confirmation!
admin.save!

# Create a moderator
moderator = User.new(
name:     'Moderator User',
email:    'moderator@example.com',
password: 'helloworld',
role:     'moderator'
)
moderator.skip_confirmation!
moderator.save!

# Create a member
member = User.new(
name:     'Member User',
email:    'member@example.com',
password: 'helloworld',
)
member.skip_confirmation!
member.save!

puts "Seed finished"
puts "#{User.count} Users created"
puts "#{List.count} lists created"
puts "#{Task.count} tasks created"
