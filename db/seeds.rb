# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Team.create!(name: 'disneyland', slug: 'disneyland')
Team.create!(name: 'basicshapes', slug: 'basicshapes')
Team.create!(name: 'iron hackers', slug: 'iron-hackers')

digital, brand = Category.create! ([{title: 'digital', description: 'Guidelines for digital products', team_id: 2, slug: 'digital'}, {title: 'brand', description: 'Brand identity and logos', team_id: 1, slug: 'brand'}])

albert, lorenzo = User.create!([
	{first_name: 'Albert', last_name: 'Ramirez', email: 'albert.ramirez.canalias@gmail.com', job_title: 'Designer', location: 'Barcelona', password: 'ironhack', password_confirmation: 'ironhack'},
	{first_name: 'Lorenzo', last_name: 'Marini', email: 'lorenzo.ita@gmail.com', job_title: 'Web Coordinator', location: 'Barcelona', password: 'ironhack', password_confirmation: 'ironhack'},
	{first_name: 'Pato', last_name: 'Donald', email: 'pato@donald.com', job_title: 'Duck', location: 'Paperopoli', password: 'ironhack', password_confirmation: 'ironhack'},
	{first_name: 'Mickey', last_name: 'Mouse', email: 'mickey@gmail.com', job_title: 'Rata', location: 'Rome', password: 'ironhack', password_confirmation: 'ironhack'}
	])

CatUser.create!(user_id: '1', category_id:'1')
CatUser.create!(user_id: '1', category_id:'2')
CatUser.create!(user_id: '2', category_id:'2')
CatUser.create!(user_id: '2', category_id:'1')
CatUser.create!(user_id: '3', category_id:'2')


Participation.create!(user_id: '1', team_id: '1')
Participation.create!(user_id: '2', team_id: '1')
Participation.create!(user_id: '3', team_id: '1')
Participation.create!(user_id: '4', team_id: '1')
Participation.create!(user_id: '1', team_id: '2')
Participation.create!(user_id: '2', team_id: '2')
