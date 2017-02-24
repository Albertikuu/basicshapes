class Category < ApplicationRecord
	has_many :cat_users
	has_many :users, through: :cat_users
	belongs_to :team

	validates_presence_of :title

#validates uniqueness of name within team.categories

end
