class ApplicationController < ActionController::Base
# before_action :load_categories
protect_from_forgery with: :null_session

	def signed?
		unless user_signed_in?
			redirect_to root_path
		end
	end

end
