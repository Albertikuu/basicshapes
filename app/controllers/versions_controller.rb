class VersionsController < ApplicationController
	before_action :authenticate_user!

	def show
		@version = Version.find_by(id: params[:version_id])
		@edit_commit_list = (@version.page.versions).sort_by(&:created_at).reverse
		# binding.pry
	end

	def version_params
		params.permit(:title, :description, :content, :user_id, :page_id)
	end

private

	# def current_page
	# 	@current_page = Page.find_by(slug: session[:current_page]['slug'])
	# end

end
