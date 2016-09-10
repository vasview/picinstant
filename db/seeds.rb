# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(fullname: 'Administrator', nickname: 'admin', email: 'admin@example.com', password: '123456', password_confirmation: '123456')

10.times do
	u = User.new
	u.fullname = Faker::Name.name
	u.nickname = Faker::Name.name
	u.email = Faker::Internet.email
	u.password = '123456'
	u.password_confirmation = '123456'
	u.save
end