class UsersController < ApplicationController
  before_action :require_owner, only: [:edit, :update, :delete]
  def show
    @user = User.find(params[:id])
    add_breadcrumb 'Προφίλ', profile_path
  end

  def update_password_with_password(params, *options)
    current_password = params.delete(:current_password)

    result = if valid_password?(current_password)
               update_attributes(params, *options)
             else
               assign_attributes(params, *options)
               valid?
               errors.add(:current_password, current_password.blank? ? :blank : :invalid)
               false
    end

    clean_up_passwords
    result
  end

  def sold
    type = params[:type]
    @classified = Classifind.find(params[:id])

    if type == 'sold'
      @classified.sold = true
      redirect_to :back
    else
      @classified.solr = false
      redirect_to :back
    end
  end

  def name
    first_name
  end

  def mailboxer_email(_object)
    email
  end

  private

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
