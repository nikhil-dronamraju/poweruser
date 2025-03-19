class AuthController < ApplicationController
  include Authentication
  # include ErrorHandling
  # include AuthHelper
  before_action :check_logged_in, except: [:root, :log_in, :sign_up]

  def root
    render json: { success: true, message: 'Welcome!' }, status: :ok
  end

  # So, there's still a lot of other errors here.
  # For example, what about dup users?
  def sign_up
    user = User.create(user_params)
    if user.errors.present?
      error = user.errors.first
      err_attr = error.attribute
      err_msg = error.message
      render json: { success: false, error_attr: err_attr, error_msg: err_msg }
    end
    session[:user_id] = user.id
    # render json: { success: true }
  # rescue StandardError => e
  #   puts e.inspect
  #   render json: { success: false, error_message: e.message }
  end

  def log_in
    # session[:page_type] = "log_in"
    # session[:user_id] = nil
    # @user = User.new
    puts session.inspect
  end

  def log_user_in
    @errors = []
    user = User.find_by(username: user_params[:username])
    password = user_params[:password]
    @errors << "User not found." if user.nil?
    @errors << "Password not correct." unless user&.authenticate(password)
    session[:user_id] = user.id
    render json: { success: true }
  rescue StandardError => e
    pp e.message
    render json: { success: false }
  end



  private

  def user_params
    params.require(:user).permit(
      :username, :first_name, :password, :email,
      tracks_attributes: [ :icon, :title, :start_date, :end_date ],
      sagas_attributes: [ :title, :content, :start_date, :end_date ]
      )
  end
end
