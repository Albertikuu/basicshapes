class CommitsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: :create


	def new
	end

	def create
		binding.pry
		#cannot upload image through Ajax, fix that (maybe a save image button in a pop up?)
		@commit = Commit.create!(commit_params)
		redirect_to('/')
	end

	private

	def commit_params
		params.permit(:title, :message, :image, :user_id, :version_id, :page_id)
	end

end
