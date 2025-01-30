module Authentication
  extend ActiveSupport::Concern
  # How do I notify the user of any errors?
  def log_in(user_params)
    user = User.find_by(username: user_params[:username])
    case
    when user.nil?
      user = User.create(user_params)
      if user.valid?
        session[:user_id] = user.id
        redirect_to controller: :dashboard, action: :home
      end
    when user.present?
      if user.authenticate(user_params[:password])
        session[:user_id] = user.id
        redirect_to controller: :dashboard, action: :home
      else
        flash[:notice] = "Authentication failed. Please try again."
        log_out
      end
    else
      log_out
    end
  end

  def check_login
    session[:user_id].nil?
    log_out if !session[:user_id]
  end

  def log_out
    session[:user_id] = nil
    redirect_to controller: :auth, action: :sign_up
  end
end
