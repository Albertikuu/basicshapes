class Team < ApplicationRecord
	has_many :users, through: :participations
	has_many :categories
	has_many :participations

	validates_presence_of :name
	validates_uniqueness_of :name

end
