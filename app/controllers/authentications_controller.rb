class AuthenticationsController < ApplicationController  
  def index  
  end  
  
  def handle_unverified_request
    true
  end



  def create
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect(:user, authentication.user)
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to '/'
    elsif omniauth['provider'] == 'twitter' && user = User.find_by_username(omniauth['info']['nickname'])
      user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      sign_in_and_redirect(:user, user)
    else
      user = User.new
      user.apply_omniauth(omniauth)
      logger.warn(omniauth.inspect)
      if user.email?
          user.save!
          flash[:notice] = "Signed in successfully with " +  omniauth['provider']
          sign_in_and_redirect(:user, user)
      else
        flash[:alert] = "Please complete registration"
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end
    
  def destroy  
  end  
  
  def root_path
    '/'
  end
end