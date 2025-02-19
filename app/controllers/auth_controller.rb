class AuthController < ApplicationController
  include Authentication
  include ErrorHandling
  include AuthHelper

  def sign_up
    session[:user_id] = nil
    session[:page_type] = "sign_up"
    @user = User.new
    @user.sagas.build
    6.times { @user.tracks.build }
  end

  def log_in
    session[:user_id] = nil
    session[:page_type] = "log_in"
    @user = User.new
  end

  def create_or_login_user
    @user = handle_authentication
    @errors = flash[:errors]
    if @user&.sagas&.present?
      redirect_to dashboard_home_path
    end
  end

  def users
    if session[:page_type] == "sign_up"
      user = User.new(user_params)
      user.save!
      session[:user_id] = user.id
    else
      user = handle_authentication
    end
    redirect_to dashboard_home_path
  rescue StandardError => e
    errors = format_errors(user.errors)
    render turbo_stream: turbo_stream.replace("err_messages", partial: "layouts/error_messages", locals: { messages: errors })
  end

  private

  def user_params
    params.require(:user).permit(
      :username, :name, :password,
      tracks_attributes: [:icon, :title],
      sagas_attributes: [:title, :content, :start_date, :end_date]
      )
  end
end
