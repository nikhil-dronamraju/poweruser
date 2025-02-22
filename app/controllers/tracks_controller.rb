class TracksController < ApplicationController
  include Authentication
  before_action :check_logged_in
  def index
    @user = User.find(session[:user_id])
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def delete
  end
end
