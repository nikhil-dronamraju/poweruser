module Authentication
  extend ActiveSupport::Concern

  def log_user_in(user_params)
    username = user_params[:username]
    password = user_params[:password]
    name = user_params[:name]
    user = User.find_by(username: username)
    if user.nil?
      user = User.create(username: username, password: password)
      if user.errors.present?
        flash[:messages] = []
        user.errors.full_messages.each do |err_msg|
          flash[:messages] << err_msg unless err_msg == "can't be blank"
          flash[:messages] << "ERROR: Password is blank." if err_msg == "can't be blank"
        end
        redirect_to auth_sign_up_path
      else
        session[:user_id] = user.id
        redirect_to dashboard_home_path
      end
    else
      authentication = user.authenticate(password)
      if authentication == false
        flash[:messages] = [ "Wrong password. Please try again." ]
        log_user_out
      else
        session[:user_id] = user.id
        redirect_to dashboard_home_path
      end
    end
  rescue
    p user.errors.full_messages
  end

  def check_logged_in
    user = User.find_by(id: session[:user_id])
    redirect_to root_path if user.nil?
  end

  def log_user_out
    session[:user_id] = nil
    redirect_to root_path
  end
end
