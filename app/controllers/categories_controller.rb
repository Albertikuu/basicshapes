class CategoriesController < ApplicationController
before_action :authenticate_user!
skip_before_action :verify_authenticity_token, only: :create


	def show 
		current_team = Team.find_by(id: session[:current_team]["id"])
		@category = Category.find_by(title: params[:title])	
		@team_users = current_team.users.select {|user| user.categories.exclude?(@category)}
		unless @category.users.include?(current_user)
			redirect_to('/')
		end
	end

	def index
		if session[:categories]
			render json: session[:categories]
		end
	end

	def new
	end

	def create
		@category = current_user.categories.create!(category_params)
	    session[:categories] = current_user.categories.where(team_id: session[:current_team]["id"])	
		redirect_to('/')
	end

	def destroy
		@category = Category.find_by(title: params[:title]).delete
	    session[:categories] = current_user.categories.where(team_id: session[:current_team]["id"])	
		redirect_to('/')
	end

	def add_user
		user = User.find_by(id: params[:user_id])
		Category.find_by(title: params[:title]).users << user
		redirect_to(:back)
	end


	private

	  def category_params
   		 params.permit(:title, :description, :team_id)
	  end

end
