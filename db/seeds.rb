# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all


emails = ["kuba@wp.pl", "agatka@wp.pl", "jurek@wp.pl"]

emails.map { |address| User.create(email: address, password: "haslo123" )}
10.times { User.create(email: Faker::Internet.unique.email, password: "haslo123" )}

workouts = ["Jogging", "Swimming", "Weightlifitng", "Karate"]

User.all.each do |person|
  ((Date.today - 7)..Date.today).to_a.each do |day|
    Exercise.create(user_id: person.id, duration_in_min: rand(100), workout: workouts[rand(4)], workout_date: day)
  end
end
