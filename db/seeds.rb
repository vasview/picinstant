# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(fullname: 'Administrator', nickname: 'admin', email: 'admin@example.com', password: '123456', password_confirmation: '123456')

11.times do
	u = User.new
	u.fullname = Faker::Name.name
	u.nickname = Faker::Name.first_name
	u.email = Faker::Internet.email
	u.password = '123456'
	u.password_confirmation = '123456'
	u.save
end

def copy_image_fixture(file_name, id)
  dir = Rails.root.join('public', 'uploads')
  Dir.mkdir(dir) unless File.directory?(dir)
  FileUtils.cp(file_name, dir.join(id.to_s))
end

users = User.all

fixtures_path = Rails.root.join('app', 'assets', 'images', 'fixtures')


imgs = ['balloons.jpg', "detsvo.jpg", "events_1.jpg", "lady_bird.jpg", "sunrise.jpg"]

11.times do
	f = Photo.new
	f.title = Faker::Lorem.characters(20)
	f.description = Faker::Lorem.sentence
	f.user_id = users.find(rand(1..11)).id
	f.likes_count = '0'
	f.image = File.new(fixtures_path.join(imgs.sample))
	f.save
end

photos = Photo.all

for photo in photos 
	photo.comments.create(body: Faker::Lorem.sentence, user_id: users.find(rand(1..11)).id)
	rand(1..5).times do
		photo.likes.create(photo_id: photo.id, user_id: users.find(rand(1..11)).id)
	end
end

10.times do 
	frd = Followship.new
	frd.user_id = users.find(rand(1..11)).id
	frd.follower_id = users.find(rand(1..11)).id
	frd.save
end