class Category < ApplicationRecord
  has_many :cat_users
	has_many :users, through: :cat_users

end
