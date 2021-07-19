# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'bcrypt'

Visitor.destroy_all

50.times do |index|
	Visitor.create!(
	  email: Faker::Internet.email,
	  city: Faker::Address.city,
	  state: Faker::Address.state
	)
end

User.destroy_all

auth_emails = ["daymonanderson2@gmail.com","ntuifranklin2005@gmail.com","fnkokamn@terpmail.umd.edu"]

auth_emails.each { |anemail|
	bullshit_password = Faker::Internet.password(min_length:10, max_length:30)
	User.create!(
           email: anemail,
           password: BCrypt::Password.create(bullshit_password)    
	)		

}

