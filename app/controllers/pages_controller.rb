class PagesController < ApplicationController

	def new
		@page = Page.new
	end

	def create
		binding.pry
		@page = Page.create!(page_params)
		binding.pry
		@page.slug.downcase.gsub!(' ','-')
		@version = @page.versions.create!(version_params)
		binding.pry
		redirect_to('/')
		# @page.title = @version.title 
		# @page.description = @version.description
		#redirect to commit#new
	end

	def show
		binding.pry
		page = Page.find_by(slug: params[:page_slug])
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
