class PagesController < ApplicationController

	def new
		@page = Page.new
	end

	def create
		@page = Page.create!(page_params)
		@version = Version.create!(version_params)
		@page.title = @version.title 
		@page.description = @version.description
		#redirect to commit#new
	end

	def show
		page = Page.find_by()
		@page = page.versions.last
	end

end
