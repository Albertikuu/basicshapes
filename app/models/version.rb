class Version < ApplicationRecord
	belongs_to :page
	belongs_to :user

	validates_presence_of :title
end
