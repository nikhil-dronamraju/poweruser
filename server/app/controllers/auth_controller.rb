class AuthController < ApplicationController
  # include Authentication
  # include ErrorHandling
  # include AuthHelper

  def sign_up
    # session[:page_type] = "sign_up"
    # session[:user_id] = nil
    @user = User.new
    @user.sagas.build
    6.times { @user.tracks.build }
  end

  def sign_user_up
    user = User.new(user_params)
    user.save!
    session[:user_id] = user.id
    redirect_to dashboard_home_path
  rescue StandardError => e
    errors = format_errors(user.errors)
    render turbo_stream: turbo_stream.replace("err_messages", partial: "layouts/error_messages", locals: { messages: errors })
  end

  def log_in
    # session[:page_type] = "log_in"
    # session[:user_id] = nil
    @user = User.new
  end

  def log_user_in
    @errors = []
    user = User.find_by(username: user_params[:username])
    password = user_params[:password]
    @errors << "User not found." if user.nil?
    @errors << "Password not correct." unless user&.authenticate(password)
    if user&.authenticate(password)
      session[:user_id] = user.id
      redirect_to dashboard_home_path
    end
  rescue StandardError => e
    @errors = [ e.message ]
  end



  private

  def user_params
    params.require(:user).permit(
      :username, :name, :password, :email,
      tracks_attributes: [ :icon, :title, :start_date, :end_date ],
      sagas_attributes: [ :title, :content, :start_date, :end_date ]
      )
  end
end
