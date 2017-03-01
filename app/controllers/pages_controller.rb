class PagesController < ApplicationController

	def new
		@page = Page.new
	end

	def create
		page = Page.new(page_params)
		page.slug = page.slug.downcase.gsub!(' ','-')
		page.save
		version = page.versions.create!(version_params)
		session[:linked_version] = version
		redirect_to("/commits/#{page.id}/#{version.id}/new")
		# @page.title = @version.title 
		# @page.description = @version.description
		#redirect to commit#new
	end

	def show
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
