# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
Artist.delete_all
Image.delete_all
Event.delete_all

admin_user = User.create(
  name: "admin",
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD']
)

primary_user = User.create(
  name: ENV['PRIMARY_USER_NAME'],
  email: ENV['PRIMARY_USER_EMAIL'],
  password: ENV['PRIMARY_USER_PASSWORD']
)

primary_artist = Artist.create(
  name: 'new artist',
  voice_type: 'voice type',
  email: ENV['PRIMARY_USER_EMAIL'],
  management_url: 'http://placeholder-change-this.com'
)

admin_user.artists << primary_artist
primary_user.artists << primary_artist

p User.all
p Artist.all
