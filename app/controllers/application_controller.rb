class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :ensure_logged_in	#, only: [:new , :create] only gives access to thesese 
  																

  helper_method :current_user # when we define methods in our application controller cant be acessed in views without this

  private

  def current_user
  	current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def ensure_logged_in					#this checks to make sure they are looged in
  	if current_user.nil?
  		redirect_to login_path
  	end
  end
end
