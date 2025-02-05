module Authentication
  extend ActiveSupport::Concern

  def log_user_in(user_params)
    username = user_params[:username]
    password = user_params[:password]
    name = user_params[:name]
    tracks = user_params[:tracks]
    user = User.find_by(username: username)
    if user.nil?
      user = User.new(username: username, name: name, password: password)
      tracks&.each do |track_id|
        user.tracks << Track.find(track_id)
      end
      user.save!
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
  end

  def check_logged_in
    user = User.find_by(id: session[:user_id])
    if user.nil?
      redirect_to root_path
    else
      user
    end
  end

  def log_user_out
    session[:user_id] = nil
    redirect_to root_path
  end

  def check_onboarded
    user = check_logged_in
    if user.present?
      redirect_to auth_onboarding_path if user.tracks.count.zero?
    end
  end
end
