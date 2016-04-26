# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(first_name: 'Andrea', last_name: 'Airall', email: 'test1@email.com', password_digest: BCrypt::Password.create('Pass1234'))
User.create!(first_name: 'Chris', last_name: 'Bates', email: 'test2@email.com', password_digest: BCrypt::Password.create('Pass1234'))
User.create!(first_name: 'Tan', last_name: 'Lui',  email: 'test3@email.com', password_digest: BCrypt::Password.create('Pass1234'))
User.create!(first_name: 'David', last_name: 'Quigley', email: 'test4@email.com', password_digest: BCrypt::Password.create('Pass1234'))
