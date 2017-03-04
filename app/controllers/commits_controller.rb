class CommitsController < ApplicationController
	skip_before_action :verify_authenticity_token, only: :create


	def index
   		commits = []
   		current_user.teams.each do |t|
   			commits << t.commits
   		end
		render json: commits
	end

	def new
	end

	def create
		@commit = Commit.create!(commit_params)
		redirect_to('/')
	end


	private

	def commit_params
		params.permit(:title, :message, :image, :user_id, :version_id, :page_id)
	end

end
