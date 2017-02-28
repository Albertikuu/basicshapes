class VersionsController < ApplicationController
before_action: :current_page

	def new 
	end

	def create
		@version = @current_page.versions.create!(version_params)
		@current_page.title = @version.title
		@current_page.description = @version.description
	end

private

	def current_page
		@current_page = Page.find_by(id: session[:current_page]['id'])
	end

end
