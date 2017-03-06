class Page < ApplicationRecord
belongs_to :category
has_many :versions
has_many :commits
	
 validates_presence_of :slug
 validates :slug, uniqueness: { scope: :category_id,
    message: "this page already exists", case_sensitive: false }



end
