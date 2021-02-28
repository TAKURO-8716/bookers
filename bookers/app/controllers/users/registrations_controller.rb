# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  # GET /resource/sign_up
  def new
    super
  end

  # POST /resource
  # def create
  #   super
  # end

  # GET /resource/edit
  def edit
    super
    
    # @user = User.find(params[:id])
  end

  # PUT /resource
  def update
    # super
    # binding.pry
    # user = current_user
    # @user = User.find(params[:id])
    # @user.update(account_update_params)
    # user.assign_attributes(account_update_params)
    if current_user.update(account_update_params)
        redirect_to users_path(account_update_params)
    else
        render "profile_edit"    # users_path
    end
  end
  
  # binding.pry
  def create
    User.new(user_params).save
  end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
  
  def user_params
    params.require(:user).permit(:image)
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    users_path(resource)
  end
  
  #アカウント編集後のリダイレクト先
  def after_update_path_for(resource)
    users_path(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    users_path(resource)
  end
  
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    # devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
  def configure_account_update_params
    # added_attrs = [:name, :image, :introduction]
    # devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    
    devise_parameter_sanitizer.require(:account_update).permit(:account_update, keys: [:name])
    devise_parameter_sanitizer.require(:account_update).permit(:account_update, keys: [:introduction])
    devise_parameter_sanitizer.require(:account_update).permit(:account_update, keys: [:image])
  end
end
