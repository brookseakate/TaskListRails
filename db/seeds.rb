# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
4.times do |i|
  Task.create(title: "#{Faker::Hacker.verb.capitalize} #{Faker::Superhero.power} Book",
  description: "#{Faker::Beer.hop} #{Faker::StarWars.quote}",
  completed_at: Faker::Time.backward(30),
  completion_status: ["completed", "accepted"].sample)
end

4.times do |i|
  Task.create(title: "#{Faker::Hacker.verb.capitalize} #{Faker::Superhero.power} Book",
  description: "#{Faker::Beer.hop} #{Faker::StarWars.quote}",
  completion_status: ["defined", "deep freeze", "on deck", "in progress", "blocked"].sample)
end
