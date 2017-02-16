# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:

50.times do |n|
   Trip.create!(name:  "Tawang", description: "Zero degree")
end

50.times do |n|
  email = Faker::Internet.email
  password = "password"
  User.create!(email: email,
               password:              password,
               password_confirmation: password)
end

users = User.all
user  = users.fourth
following = users[7..50]
followers = users[7..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
