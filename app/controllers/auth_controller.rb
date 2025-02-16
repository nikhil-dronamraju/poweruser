class AuthController < ApplicationController
  include Authentication
  include ErrorHandling
  include AuthHelper

  def sign_up
    session[:user_id] = nil
    @user = User.new
    @saga = Saga.new
  end

  def log_in
    session[:user_id] = nil
    session[:page_type] = :auth
    @user = User.new
  end

  def create_or_login_user
    @user = handle_authentication
    @errors = flash[:errors]
    if @user&.sagas&.present?
      redirect_to dashboard_home_path
    end
  end

  def tracks
  end

  def users
    @user = handle_authentication
    redirect_to dashboard_home_path if @user.present?
  end

  def show_track_form
    @user = User.new(user_params)
    @user.save
    @errors = user_generic_errors(@user.errors.messages) if @user.errors.present?
    p @errors
  end

  def create_user_track
    if params[:commit] == "Select default"
    #   Use the default parameters
    else
    # Write a method that:
    # First, checks the track params
    # For each track,
    # If all of the titles are blank/invalid - thow an error
    # Otherwise, create them only for the ones that are filled out
    # For the icons, if they are blank, use the default
    # Otherwise, use the one the user provides
    # We can store this in the track model
    tracks = Track.generate_from_onboarding(user_track_params[:track])
    end
    @user = User.new(user_track_params[:user])
  rescue
    # So come up with a better approach for this.
    render turbo_stream: turbo_stream.replace("err_messages", partial: "layouts/error_messages", locals: { messages: [ "All tracks can't be blank." ] })
  end

  private

  def user_params
    params.require(:user).permit(:username, :name, :password)
  end

  def user_track_params
    params.require(:user_track).permit(user: [ :name, :password, :username ], track: [ :title, :icon ])
  end
end
