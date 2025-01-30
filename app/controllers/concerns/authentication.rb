module Authentication
  extend ActiveSupport::Concern

  def log_user_in(user_params)
    username = user_params[:username]
    password = user_params[:password]
    user = User.find_by(username: username)
    authentication = user.authenticate(password)
    if authentication == false
      log_user_out
    else
      session[:user_id] = user.id
      redirect_to dashboard_home_path
    end
  end

  def check_logged_in
    user = User.find_by(id: session[:user_id])
    p user
    redirect_to root_path if user.nil?
  end

  def log_user_out
    session[:user_id] = nil
    redirect_to root_path
  end
end
