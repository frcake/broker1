class UsersController < ApplicationController


	def new
		#render :layout => '../users/new'
		@user = User.new
	end


	def create
		@user = User.new(user_params)
		if @user.save
			#session[:user_id].new(user_params)
			redirect_to	'/'
		else
			redirect_to	'signup'
		end
	end



	def edit
		@user = User.find(params[:id])
	end


	 def update
	    @user = User.find(params[:id])
	   
		if @user.update_attributes(user_params)
	      redirect_to '/'
		else
		  redirect_to '/'
		end   
 	end



	def show 
		@user = User.find(params[:id])
	end


	def list
		@user = User.find(params[:id])
		#@classifieds = @user.classified
	end

	private 

	def user_params
		params.require(:user).permit(:first_name ,:last_name,:email	,:password , :region , :telephone)
	end


end
