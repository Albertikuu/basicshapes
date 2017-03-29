class Invitation < ApplicationRecord
before_create :generate_token

      belongs_to :team
      belongs_to :sender, :class_name => 'User'
      belongs_to :recipient, :class_name => 'User'


	def generate_token
	   self.token = Digest::SHA1.hexdigest([self.team_slug, Time.now, rand].join)
	end

end
