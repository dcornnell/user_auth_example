class SessionsController <ApplicationController
 	skip_filter :ensure_logged_in
 	def new

 	end

 	def create
 		# user = User.authenticate(params[:email],params[:password]) #checks for a user, athenticate must be defined
 		user = User.find_by_email(params[:email]).try(:authenticate, params[:password])  #try mask sure its not till before proceeding
 		if user 																									
 			session[:user_id] = user.id
 			redirect_to new_user_path, notice: "logged in"
 		else
 			flash.now.alert = "invalid email or pw"
 			render :new
 		end
 	end

 	def destroy
 		session[:user_id] =nil
 		redirect_to login_path, notice: "You logged out"
 	end
end