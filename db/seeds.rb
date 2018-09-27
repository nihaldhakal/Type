# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
(1..10).each do |index|
  new_user=User.new
  new_user.email="#{index}@gmail.com.tdlr"
  new_user.password = "abcdef"
  new_user.password_confirmation = "abcdef"
  new_user.save!
end

(1..5).each do
  Race.create!({
                   description: "Lord of the rings",
                   value: "This is a long long string"
               })
end


(1..25).each do
  random_user_id = User.all.map(&:id).sample
  random_race_id = Race.all.map(&:id).sample
  random_user = User.find(random_user_id)
  random_race = Race.find(random_race_id)

  new_participatedrace= ParticipatedRace.new
  new_participatedrace.wpm = 50
  new_participatedrace.user_id = random_user.id
  new_participatedrace.race_id = random_race.id
  new_participatedrace.accuracy=40
  new_participatedrace.save!

end