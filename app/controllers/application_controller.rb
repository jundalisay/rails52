class ApplicationController < ActionController::Base  
  
    before_action :configure_permitted_parameters, if: :devise_controller?  
    # before_action :store_user_location!, if: :storable_location? # for redirect back
    protect_from_forgery with: :exception
    before_action :set_locale
    
  
    # devise allow user to edit password without password confirmation solution 2 
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:country_id, :password, :password_confirmation, :current_password, :name, :gender, :email, :global_id, :kind,  :photo, :logistics_provider, :can_message, :can_email, :locale, :points])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:country_id, :password, :password_confirmation, :current_password, :name, :gender, :email, :global_id, :kind, :photo, :logistics_provider, :can_message, :can_email, :locale, :points])
    end
  
  
    def set_locale
      I18n.locale = params[:locale] || I18n.default_locale
    end
  
    def default_url_options(options = {})
      { locale: I18n.locale }.merge options
    end
  
end