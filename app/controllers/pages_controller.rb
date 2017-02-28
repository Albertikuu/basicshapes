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
		page = Page.find_by(slug: params[:slug])
		@page = page.versions.last
	end

	private

	def page_params
		params.permit(:slug, :category_id)
	end

	def version_params
		params.permit(:title, :description, :content, :user_id, :page_id)
	end
	
end
