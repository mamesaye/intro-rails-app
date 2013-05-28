class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
  	if cookies[:user_id] # check value is set
  		user_id = cookies.signed[:user_id]  #grab value
  		@current_user = User.find_by_id(user_id) #instance variable to use from controller 2 view 

  	end
  end
  # to make it available to the views
  helper_method :current_user

  #not a helper method views don't need it just ctller need it
  def sign_in user
  	cookies.signed[:user_id] = user.id 
  end

  def authenticate
  	if !signed_in?
  		redirect_to new_session_path
  	end
  end

  def signed_in?
  	current_user  #nil or #<User> ie intance of a user
  end
  helper_method :signed_in?
end
