class CategoriesController < ApplicationController
before_action :authenticate_user!
before_action :find_teams
include Find_teams
skip_before_action :verify_authenticity_token, only: [:create, :change_title, :order_pages]


	def show
		current_team = Team.find_by(id: session[:current_team]["id"])
		@category = current_team.categories.find_by(slug: params[:title_slug])
		@team_users = current_team.users.select {|user| user.categories.exclude?(@category)}
		session[:current_category] = @category
		unless @category.users.include?(current_user)
			redirect_to('/')
		end
		@files = @category.documents
	end

	def sort
		current_team = Team.find_by(id: session[:current_team]["id"])
		@category = current_team.categories.find_by(slug: params[:title_slug])
		@team_users = current_team.users.select {|user| user.categories.exclude?(@category)}
		session[:current_category] = @category
		unless @category.users.include?(current_user)
			redirect_to('/')
		end
		@files = @category.documents

	end

	def index
   		team = Team.find_by(slug: params[:team_slug])

			# format.html { redirect_to @company, notice: 'Company was successfully updated.' }
   			# format.json {}
      	render json: team.categories
	end

	def new
	end

	def create
		@category = current_user.categories.create!(category_params)
		@category.slug = @category.title.gsub(' ','-')
		@category.save
	    session[:categories] = current_user.categories.where(team_id: session[:current_team]["id"])
		redirect_to('/')
	end

	def destroy
		Category.find_by(slug: params[:title_slug]).delete
	    session[:categories] = current_user.categories.where(team_id: session[:current_team]["id"])
		redirect_to('/')
	end

	def change_title
		category = Category.find_by(slug: params[:title_slug])
		category.update_attribute(:title, params[:title])
		session[:categories] = current_user.categories.where(team_id: session[:current_team]["id"])
		redirect_to(:back)
	end

	def add_user
		user = User.find_by(id: params[:user_id])
		Category.find_by(slug: params[:title_slug]).users << user
		redirect_to(:back)
	end

	def toggle_public
		category = Category.find_by(slug: params[:title_slug])
	    if category.is_public? == false
	    	category.update_attribute(:is_public?, true)

	    else
	    	category.update_attribute(:is_public?, false)
	    end
	end

	def add_file
		Category.find_by(slug: session[:current_category][:slug]).documents.create!(document_params)
		redirect_to(:back)
	end

	def order_pages	
		params[:list].each {|id, pos| Page.find_by(id: id).update_attribute(:position, pos)}
	end


	private

	def category_params
		params.permit(:title, :description, :team_id)
	end


	def document_params
		params.require(:document).permit(:file)
	end

end
