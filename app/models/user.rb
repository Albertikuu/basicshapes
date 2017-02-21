class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	validates_presence_of :first_name, :last_name
	validates_uniqueness_of :email, :case_sensitive => false

	has_many :cat_users
	has_many :participations
	has_many :categories, through: :cat_users
	has_many :teams, through: :participations

	def full_name
		self.first_name + ' ' + self.last_name
	end
  
end
