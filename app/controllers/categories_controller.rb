class CategoriesController < ApplicationController

	def show 
		@category = Category.find_by(title: params[:title])
		
	end

	def new
		@category = Category.new
	end

	def create
		@category = current_user.categories.create!(category_params)
    	session[:categories] = current_user.categories
		redirect_to('/')
	end

	def destroy
		@category = Category.find_by(title: params[:title]).delete
		redirect_to('/')
	end


	private

	  def category_params
   		 params.permit(:title, :description)
	  end


end
