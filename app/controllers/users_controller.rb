class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]


	def show
		@users = User.all
		@user = User.find(params[:id])
		@other_categories = Category.all - @user.categories
	end


end
