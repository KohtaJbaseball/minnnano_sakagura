class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :user_state, only: [:create]

  def after_sign_in_path_for(resource)
    users_my_page_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  #def user_state
    #@user = User.find_by(email: params[:user][:email])
    #return if !@user
    #if @user.valid_password?(params[:user][:password]) && (@user.is_deleted == false)
      #redirect_to new_user_registration_path
    #else
     #@user = User.new(user.params)
      #@user.save
    #end
  #end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :birthday, :sex])
  end
end
