module Authentication
  extend ActiveSupport::Concern
  include ErrorHandling

  def handle_authentication
    user_params = params[:user]
    username = user_params[:username]
    password = user_params[:password]
    name = user_params[:name]
    tracks = user_params[:tracks]
    user = User.find_by(username: username)
    if user.nil?
      user = sign_user_up(username, password, name, tracks)
    else
      user = log_user_in(username, password)
    end

    user
  end
  def sign_user_up(username, password, name, tracks)
    user = User.new(username: username, name: name, password: password)
    tracks&.each do |track_id|
      user.tracks << Track.find(track_id)
    end
    user.save
    if user.errors.any?
      flash[:errors] = format_errors(user.errors)
      return nil
    end
    session[:user_id] = user.id

    user
  end

  def log_user_in(username, password)
    user = User.find_by(username: username)
    if user.authenticate(password)
      session[:user_id] = user.id
      return user
    else
      flash[:errors] = ["ERROR. Invalid password"]
    end

    nil
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
