class PagesController < ApplicationController
	skip_before_action :verify_authenticity_token, only: :create

	def index
		# format.html { redirect_to @company, notice: 'Company was successfully updated.' }
   		# format.json {}
   		team = Team.find_by(slug: params[:team_slug])
   		updated_pages = []
   			team.pages.each do |p|
   				updated_pages << p.versions.last
   			end
  		render json: updated_pages
	end


	def new
		@page = Page.new
	end

	def create
		page = Page.new(page_params)
		page.slug = page.slug.downcase.gsub(' ','-') + "-#{Page.last.id + 1}"
		page.save
		session[:page] = page
		first_version(page)
	end

	def first_version(page)
		version = page.versions.create!(version_params)
		session[:linked_version] = version
		redirect_to(new_commit_path(page.id, version.id))
	end

	def create_version
		page = Page.find_by(slug: params[:page_slug])
		
		unless page.versions.last.title == version_params['title'] && page.versions.last.description == version_params['description'] && page.versions.last.content == version_params['content']	
			version = page.versions.create!(version_params)
		end
		
		redirect_to(:back)
	end

	def destroy
		Page.find_by(slug: params[:page_slug]).delete
		redirect_to('/')
	end

	def show
		page = Page.find_by(slug: params[:page_slug])
		session[:page] = page
		@page = page.versions.last
		@edit_commit_list = (page.versions + page.commits).sort_by(&:created_at).reverse
		@files = page.documents
	end

	def add_file
		# binding.pry
		Page.find_by(slug: session[:page][:slug]).documents.create!(document_params)
		# binding.pry
		redirect_to(:back)
	end

	private

	def page_params
		params.permit(:slug, :category_id)
	end

	def version_params
		params.permit(:title, :description, :content, :user_id, :page_id)
	end

	def document_params
		params.require(:document).permit(:file)
	end
	
end
