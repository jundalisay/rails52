class SessionsController < Devise::SessionsController

  respond_to :html, :json # for rakckcors

  before_action :configure_permitted_parameters #, if: :devise_controller?
  protected
  
  def failure
   redirect_to root_path
  end

end