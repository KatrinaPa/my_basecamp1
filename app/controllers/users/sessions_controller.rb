class Users::SessionsController < Devise::SessionsController
  def create
    # Check if the email exists in the database first
    user = User.find_by(email: params[:user][:email])

    if user.nil?
      flash[:alert] = "Email not found. Please check your email or sign up."
      redirect_to new_user_session_path and return
    end

    if user.valid_password?(params[:user][:password])
      # Successful authentication
      self.resource = user
      set_flash_message!(:notice, :signed_in)
      sign_in(resource_name, resource)
      yield resource if block_given?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      # Password is incorrect
      flash[:alert] = "Incorrect password. Please try again."
      redirect_to new_user_session_path
    end
  end
end
