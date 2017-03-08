class Document < ApplicationRecord
	 belongs_to :documentable, polymorphic: true

	 has_attached_file :file
	 validates_attachment :file, presence: true, content_type: {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
end
