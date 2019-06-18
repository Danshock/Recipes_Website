class ConfirmationsController < Devise::ConfirmationsController
  private
  
  # The user will be signed in when they click the link in the confirmation email
  def after_confirmation_path_for(resource_name, resource)
    sign_in(resource) 
    root_path
  end
end