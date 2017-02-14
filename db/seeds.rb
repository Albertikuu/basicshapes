# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


digital, brand = Category.create! ([{title: 'digital', description: 'Guidelines for digital products'}, {title: 'brand', description: 'Brand identity and logos'}])
albert, lorenzo = User.create!([
	{first_name: 'Albert', last_name: 'Ramirez', email: 'albert.ramirez.canalias@gmail.com', job_title: 'Designer', location: 'Barcelona', password: 'ironhack', password_confirmation: 'ironhack'},
	{first_name: 'Lorenzo', last_name: 'Marini', email: 'lorenzo.ita@gmail.com', job_title: 'Web Coordinator', location: 'Barcelona', password: 'ironhack', password_confirmation: 'ironhack'}
	])

CatUser.create!(user_id: '1', category_id:'1')
CatUser.create!(user_id: '1', category_id:'2')
CatUser.create!(user_id: '2', category_id:'2')


