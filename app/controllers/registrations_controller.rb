class RegistrationsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		#render plain: params[:user]
		@user = User.new(whitelisted_user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to shogun_path, notice: "Signed up successfully!"
		else
			#flash[:alert]
			render :new
		end
	end

	private def whitelisted_user_params #this is for protection
    	params.require(:user).permit(:email,:password,:password_confirmation)
  	end
end