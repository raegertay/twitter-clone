# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1 = User.create(username: 'billgates', email: 'billgates@gmail.com', password: 'password', password_confirmation: 'password', avatar_url: 'https://cdn.filestackcontent.com/0RGN7PD1RlKOTB65cwue')
user_2 = User.create(username: 'stevejobs' , email: 'stevejobs@gmail.com', password: 'password', password_confirmation: 'password', avatar_url: 'https://cdn.filestackcontent.com/nOyLx0saSyes7TVCbFxv')
user_3 = User.create(username: 'elonmusk' , email: 'elonmusk@gmail.com', password: 'password', password_confirmation: 'password', avatar_url: 'https://cdn.filestackcontent.com/KEMy2EObSJq1CQImgjFO')
user_4 = User.create(username: 'markzuckerberg' , email: 'markzuckerberg@gmail.com', password: 'password', password_confirmation: 'password', avatar_url: 'https://cdn.filestackcontent.com/GkmZqd9jSKOO734BdQTC')
user_5 = User.create(username: 'jackdorsey' , email: 'jackdorsey@gmail.com', password: 'password', password_confirmation: 'password', avatar_url: 'https://cdn.filestackcontent.com/O6gCajVVQHC7BgwPkxX5')

5.times do
  user_1.tweets.build(body: Faker::Hacker.say_something_smart + ' #rubyonrails #ruby #webdevelopment #alphacamp').save_with_tags
  user_2.tweets.build(body: Faker::Hacker.say_something_smart + ' #rubyonrails #ruby #webdevelopment #alphacamp').save_with_tags
  user_3.tweets.build(body: Faker::Hacker.say_something_smart + ' #rubyonrails #ruby #webdevelopment #alphacamp').save_with_tags
  user_4.tweets.build(body: Faker::Hacker.say_something_smart + ' #rubyonrails #ruby #webdevelopment #alphacamp').save_with_tags
  user_5.tweets.build(body: Faker::Hacker.say_something_smart + ' #rubyonrails #ruby #webdevelopment #alphacamp').save_with_tags
end
