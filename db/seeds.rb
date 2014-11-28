require 'faker'

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

puts "Seed finished"
puts "#{List.count} lists created"
puts "#{Task.count} tasks created"
