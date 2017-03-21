class VersionsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_teams
	include Find_teams

	def show
		@version = Version.find_by(id: params[:version_id])
		@edit_commit_list = (@version.page.versions).sort_by(&:created_at).reverse
	end

	def version_params
		params.permit(:title, :description, :content, :user_id, :page_id)
	end

private


end
