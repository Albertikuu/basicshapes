class Category < ApplicationRecord
	has_many :cat_users
	has_many :users, through: :cat_users
	belongs_to :team
	has_many :pages
	has_many :versions, through: :pages
	has_many :documents, as: :documentable


  validates :title, uniqueness: { scope: :team_id,
    message: "this category already exists", case_sensitive: false }

#validates uniqueness of name within team.categories

end
