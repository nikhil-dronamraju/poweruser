class ApplicationController < ActionController::API
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  before_action :set_csrf_cookie

  def set_csrf_cookie
    cookies["CSRF-TOKEN"] = { value: form_authenticity_token, httponly: true }
  end
end
