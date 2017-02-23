class Team < ApplicationRecord
	has_many :users, through: :participations
	has_many :categories
	has_many :participations

	has_attached_file :logo, styles: { medium: "160x160>", thumb: "64x64>", mini: "32x32>" }, default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :logo, content_type: /\Aimage\/.*\z/


	validates_presence_of :name
	validates_uniqueness_of :name

end
