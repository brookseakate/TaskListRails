# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def build_task_without_user_id_and_status
  Task.new(title: "#{Faker::Hacker.verb.capitalize} #{Faker::Superhero.power} Book",
  description: "#{Faker::Beer.hop} #{Faker::StarWars.quote}",
  completed_at: Faker::Time.backward(30))
end

# 5 Faker'd complete tasks, random user_id
5.times do |i|
  task = build_task_without_user_id_and_status
  task.completion_status = ["completed", "accepted"].sample
  task.user_id = rand(1..10)
  task.save
end

# 5 Faker'd incomplete tasks, random user_id
5.times do |i|
  task = build_task_without_user_id_and_status
  task.completion_status = ["defined", "deep freeze", "on deck", "in progress", "blocked"].sample
  task.user_id = rand(1..10)
  task.save
end

# 5 Faker'd complete tasks, user_id 1 (me)
5.times do |i|
  task = build_task_without_user_id_and_status
  task.completion_status = ["completed", "accepted"].sample
  task.user_id = 1
  task.save
end

# 5 Faker'd incomplete tasks, user_id 1 (me)
5.times do |i|
  task = build_task_without_user_id_and_status
  task.completion_status = ["defined", "deep freeze", "on deck", "in progress", "blocked"].sample
  task.user_id = 1
  task.save
end
