class SagasController < ApplicationController
  include Authentication
  include ErrorHandling
  before_action :check_logged_in
  def index
    @user = User.find(session[:user_id])
    @current_saga = @user.sagas.last
    @sagas = @user.sagas
    session[:page_type] = "sagas"
  end

  def create
    @saga = Saga.new(saga_params)
    @saga.user_id = session[:user_id]
    @saga.save
    @errors = format_errors(@saga.errors)
    if @errors.present?
      return render turbo_stream: turbo_stream.replace("err_messages", partial: "layouts/error_messages", locals: { messages: @errors })
    end
    redirect_to dashboard_home_path
  end

  def new
    @user = User.find(session[:user_id])
    @saga = Saga.new
  end

  def show
    @current_saga = Saga.find(params[:id])
  end

  def edit
    @user = User.find(session[:user_id])
    @saga = Saga.find(params[:id])
  end

  def update
    @saga = Saga.find(params[:id])
    @saga.update(saga_params)
    if @saga.errors.present?
      return render turbo_stream: turbo_stream.replace("err_messages", partial: "layouts/error_messages", locals: { messages: format_errors(@saga.errors) })
    end
    redirect_to sagas_path
  end

  def destroy
    @saga = Saga.find(params[:id])
    @saga.destroy
  end

  private

  def saga_params
    params.require(:saga).permit(:user_id, :title, :start_date, :end_date, :content)
  end
end
