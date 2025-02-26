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

user = User.new(name: "Nikhil Dronamraju", password: "password", username: "thenik6")
user.tracks << Track.new(title: "Physical Health", icon: '<i class="fa-solid fa-dumbbell"></i>', start_date: Date.today, end_date: Date.today + 1.month)
user.tracks << Track.new(title: "Social Life", icon: '<i class="fa-solid fa-person"></i>', start_date: Date.today, end_date: Date.today + 1.month)
user.tracks << Track.new(title: "Mental Health", icon: '<i class="fa-solid fa-face-smile"></i>', start_date: Date.today, end_date: Date.today + 1.month)
user.tracks << Track.new(title: "Professional", icon: '<i class="fa-solid fa-user-tie"></i>', start_date: Date.today, end_date: Date.today + 1.month)
user.tracks << Track.new(title: "Creative", icon: '<i class="fa-solid fa-paintbrush"></i>', start_date: Date.today, end_date: Date.today + 1.month)
user.tracks << Track.new(title: "Quitting bad habits", icon: '<i class="fa-solid fa-syringe"></i>', start_date: Date.today, end_date: Date.today + 1.month)
user.sagas << Saga.new(title: "Sample saga", start_date: Date.today, end_date: Date.tomorrow, content: "<div>Lorem ipsum...</div>")
user.save
