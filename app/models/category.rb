class Category < ApplicationRecord
	has_many :cat_users
	has_many :users, through: :cat_users
	belongs_to :team
	has_many :pages
	has_many :versions, through: :pages
	has_many :documents, as: :documentable


  validates :title, uniqueness: { scope: :team_id,
    message: "this category already exists", case_sensitive: false }

    def sort_pages
    	if self.pages.length > 0
    		self.pages.order(:position)
    	end
    end

end
