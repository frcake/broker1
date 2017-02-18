class RegistrationsController < Devise::RegistrationsController
  def update
    # required for settings form to submit when password is left blank
    if params[:user][:password].blank? && params[:user][:password_confirmation].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    @user = User.find(current_user.id)
    if @user.update_attributes(params[:user].permit(:first_name, :region, :telephone, :email, :password, :password_confirmation))
      set_flash_message :notice, :updated
      # Sign in the user bypassing validation in case his password changed
      bypass_sign_in(@user)
      redirect_to after_update_path_for(@user)
    else
      render 'edit'
    end
   end

  protected

  def update_resource(resource, _params)
    resource.update_without_password(account_update_params)
  end

  def after_update_path_for(_resource)
    profile_path(resource)
  end

  def after_sign_up_path_for(resource)
    profile_path(resource)
  end

  private

  def sign_up_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :email, :password, :password_confirmation, :telephone, :region, :reset_password_token)
  end
end
