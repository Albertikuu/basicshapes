class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show]


	def show
		@users = User.all
		@user = User.find(params[:id])
		@user_fullname = @user.first_name + ' ' + @user.last_name
		@other_categories = Category.all - @user.categories
	end


end
