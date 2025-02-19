# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Exercise.destroy_all
Track.destroy_all
User.destroy_all

require 'csv'
csv_text = File.read(Rails.root.join('lib', 'seeds', 'megaGymDataset.csv'))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')
csv.each do |row|
  t = Exercise.new
  t.title = row['Title']
  t.desc = row['Desc']
  t.exercise_type = row['Type']
  t.body_part = row['BodyPart']
  t.equipment = row['Equipment']
  t.level = row['Level']
  t.rating = row['Rating']
  t.rating_desc = row['RatingDesc']
  t.save
  puts "#{t.title} saved"
end

Track.create(title: "Physical Health", icon: '<i class="fa-solid fa-dumbbell"></i>', is_default: true)
Track.create(title: "Social Life", icon: '<i class="fa-solid fa-person"></i>', is_default: true)
Track.create(title: "Mental Health", icon: '<i class="fa-solid fa-face-smile"></i>', is_default: true)
Track.create(title: "Professional", icon: '<i class="fa-solid fa-user-tie"></i>', is_default: true)
Track.create(title: "Creative", icon: '<i class="fa-solid fa-paintbrush"></i>', is_default: true)
Track.create(title: "Quitting bad habits", icon: '<i class="fa-solid fa-syringe"></i>', is_default: true)

user = User.new(name: "Test User", password: "password", username: "testu1", tracks: [ Track.first ])
saga = Saga.new(title: "Sample saga", start_date: Date.today, end_date: Date.tomorrow, content: "<div>Lorem ipsum...</div>", user: User.first)
user.sagas << saga
user.save
