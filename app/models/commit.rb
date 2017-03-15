class Commit < ApplicationRecord
belongs_to :user
belongs_to :page
belongs_to :version

    has_attached_file :image
  	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

	def link_to_page
		"/bs/#{self.page.category.team.slug}/#{self.page.category.slug}/#{self.page.slug}"
	end

end
