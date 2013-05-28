class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(params[:session][:email])
		sign_in(user)
		#cookies[:user_id] = user.id
		# more secure encrypted against tempering
		#cookies.signed[:user_id] = user.id # move it to appCtrl => accessible for all app
		redirect_to decks_path
	end

	def destroy
		cookies.delete(:user_id)
		redirect_to root_path
	end
end 