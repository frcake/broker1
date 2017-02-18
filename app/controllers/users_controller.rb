class UsersController < ApplicationController
  before_action :require_owner, only: [:edit, :update, :delete]
  before_action :authenticate_user!

  def edit
    @user = current_user
  end

  add_breadcrumb 'Αγγελίες', :classifieds_path
  def show
    @user = User.find(params[:id])
    add_breadcrumb 'Προφίλ', profile_path
  end

  def name
    first_name
  end

  def mailboxer_email(_object)
    email
  end

  private

  # def account_update_params
  #   params.require(:user).permit(:first_name, :email, :password, :password_confirmation, :telephone, :region, :reset_password_token)
  # end

  def user_params
    # NOTE: Using `strong_parameters` gem
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation, :telephone, :region, :reset_password_token)
  end

  def require_owner
    unless current_user == User.find(params[:id])
      flash[:notice] = 'Πρέπει να είστε μέλος για να έχετε πρόσβαση σε αυτή τη σελίδα'
    end
  end
end

#   def edit
#     @user = User.find(params[:id])
#   end
#
#
#    def update
#       @user = User.find(params[:id])
#
#     if @user.update_attributes(user_params)
#         redirect_to :back
#     else
#       redirect_to :back
#     end
#   end
#
#
#   private
#
#   def user_params
#     params.require(:user).permit(:first_name ,:last_name,:email ,:password , :region , :telephone )
#   end

#   before_action :authenticate_user!
#
#   def edit
#     @user = current_user
#   end
#
#   def update_password
#     @user = User.find(current_user.id)
#     if @user.update(user_params)
#       # Sign in the user by passing validation in case their password changed
#       sign_in @user, :bypass => true
#       redirect_to root_path
#     else
#       render "edit"
#     end
#   end
#
#   private
#
#   def user_params
#     # NOTE: Using `strong_parameters` gem
#     params.require(:user).permit(:password, :password_confirmation)
#   end
# end
#

#   def new
#     #render :layout => '../users/new'
#     @user = User.new
#   end
#
#
#   def create
#     @user = User.new(user_params)
#     if @user.save
#       #session[:user_id].new(user_params)
#       redirect_to '/'
#     else
#       redirect_to 'signup'
#     end
#   end
#
#
#
#   def edit
#     @user = User.find(params[:id])
#   end
#
#
#    def update
#       @user = User.find(params[:id])
#
#     if @user.update_attributes(user_params)
#         redirect_to '/'
#     else
#       redirect_to '/'
#     end
#   end
#
#
#
#   def show
#     @user = User.find(params[:id])
#   end
#
#
#   def list
#     @user = User.find(params[:id])
#     #@classifieds = @user.classified
#   end
#
#   private
#
#   def user_params
#     params.require(:user).permit(:first_name ,:last_name,:email ,:password , :region , :telephone)
#   end
