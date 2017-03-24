class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
 	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

    has_attached_file :avatar, styles: { medium: "96x96>", thumb: "64x64>", mini: "32x32>" }, default_url: "missing_:style.png"
  	validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

	validates_presence_of :first_name, :last_name
	validates_uniqueness_of :email, :case_sensitive => false

	has_many :cat_users
	has_many :participations
	has_many :categories, through: :cat_users
	has_many :teams, through: :participations

	def full_name
		self.first_name + ' ' + self.last_name
	end

	def first_char
	    self.first_name.chars.first + ' ' + self.last_name.chars.first
	end

	def commits 
  		Commit.where(user_id: self.id).reverse
  	end



end
