class VersionsController < ApplicationController
before_action :current_page

# page#create should be used instead?

	# def new 
	# end

	# def create
	# 	@version = @current_page.versions.create!(version_params)
	# 	@current_page.title = @version.title
	# 	@current_page.description = @version.description
	# end

	def version_params
		params.permit(:title, :description, :content, :user_id, :page_id)
	end

private

	def current_page
		@current_page = Page.find_by(slug: session[:current_page]['slug'])
	end

end
