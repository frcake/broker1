class PasswordsController < Devise::PasswordsController
  # before_filter :authenticate_user!
  before_action :authenticate_user!
  def edit
    @user = current_user
    # redirect_to edit_user_password_path if current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update_password_with_password(user_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, bypass: true
      # redirect_to edit_user_password_path, flash: { success: 'Successfully updated password' }
    end
  end

  private

  def user_params
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end
end
