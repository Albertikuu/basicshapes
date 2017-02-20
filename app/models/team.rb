class Team < ApplicationRecord
	has_many :users, through: :participations
	has_many :categories

	validates_presence_of :name
end
