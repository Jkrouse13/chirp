# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
 10.times do
   User.create!(
   name: Faker::StarWars.character,
   password: Faker::Internet.password,
   email: Faker::Internet.email
   )

end

User.create!(
name:  "Jon",
password:  "123",
email: "jk@gmail.com"
)

User.create!(
name: "Kyle",
password: "password",
email: "kwhuff@gmail.com"
)
User.create!(
name: "Sam",
password: "password",
email: "samriley1217@gmail.com"
)
User.create!(
name: "Charlie",
password: "charlie",
email: "charles.mustaklem@gmail.com"
)

20.times do
   User.all.sample.posts << Post.new(
   chirp: Faker::Company.catch_phrase
   )
end

15.times do
   User.all.sample.follow!(User.all.sample)
end
