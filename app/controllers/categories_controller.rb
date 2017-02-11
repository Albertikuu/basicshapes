class CategoriesController < ApplicationController

	def show 
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.create!
  		# render json: params
	end


end
