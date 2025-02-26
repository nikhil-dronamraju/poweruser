class TracksController < ApplicationController
  include Authentication
  before_action :check_logged_in
  def index
    @user = User.find(session[:user_id])
    @tracks = @user.tracks
  end

  def new
  end

  def create
  end

  def update
    track = Track.find(params[:id])
    track.update(track_params)
    redirect_to tracks_path
  end

  def edit
  end

  def destroy
    @track = Track.find(params[:id])
    @track.destroy
  end

  private
  def track_params
    params.require(:track).permit(:title, :start_date, :end_date)
  end
end
