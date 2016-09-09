class UsersController < ApplicationController

def show
		@user = User.find(params[:id])
end

def update_password_with_password(params, *options)
    current_password = params.delete(:current_password)

    result = if valid_password?(current_password)
               update_attributes(params, *options)
             else
               self.assign_attributes(params, *options)
               self.valid?
               self.errors.add(:current_password, current_password.blank? ? :blank : :invalid)
               false
             end

    clean_up_passwords
    result
  end

  

def name 
	first_name
end



def mailboxer_email(object)
  email
end

  
end
	

=begin
	def edit
		@user = User.find(params[:id])
	end


	 def update
	    @user = User.find(params[:id])
	   
		if @user.update_attributes(user_params)
	      redirect_to :back
		else
		  redirect_to :back
		end   
 	end


 	private 

	def user_params
		params.require(:user).permit(:first_name ,:last_name,:email	,:password , :region , :telephone )
	end
=end


=begin
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, :bypass => true
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:password, :password_confirmation)
  end
end

=end

=begin
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
=end
	


