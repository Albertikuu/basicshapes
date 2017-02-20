class CategoriesController < ApplicationController

	def show 
		@all_users = User.where.not(id: current_user.id)
		@category = Category.find_by(title: params[:title])	
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
    	session[:categories] = current_user.categories
		redirect_to('/')
	end

	def destroy
		@category = Category.find_by(title: params[:title]).delete
		session[:categories] = current_user.categories
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
