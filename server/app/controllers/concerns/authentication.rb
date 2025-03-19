module Authentication
  extend ActiveSupport::Concern

  def check_logged_in
    if session[:user_id].nil?
      render json: { success: false, error_message: "Check the authentication." }
    end
  end
end