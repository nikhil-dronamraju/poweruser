class DashboardController < ApplicationController
  include Authentication
  include ErrorHandling
  include DashboardHelper
  include GeneralViewHelper
  before_action :check_logged_in, :check_onboarded
  def home
    session[:page_type] = "dashboard"
    @user = User.find(session[:user_id])
    @saga = @user.sagas.last
    @tracks = @user.tracks
    @smart_goals = @saga.smart_goals
  end
end
