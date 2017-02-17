class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :cat_users
  has_many :categories, through: :cat_users

  def full_name
  	self.first_name + ' ' + self.last_name
  end
  
end
