class Users::SessionsController < Devise::SessionsController
  # add custom code here if needed

  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message!(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?
    respond_with resource, location: after_sign_in_path_for(resource)
  rescue
    flash[:alert] = if params[:user][:password].length < 6
      "Password is too short (minimum is 6 characters)"
    else
      "Invalid email or password"
    end
    redirect_to new_user_session_path
  end
end
