class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def show
  end


  def create
    @user = User.new(user_params)
    @user.save
    redirect_to @user
  end

    def facebook
      @user = User.from_omniauth(request.env["omniauth.auth"])
      sign_in_and_redirect @user
    end

  private
  def user_params
    params.require(:user).
      permit(:first_name, :last_name,:email,:password,:password_confirmation)
  end
end
