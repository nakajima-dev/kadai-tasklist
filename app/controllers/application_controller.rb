class ApplicationController < ActionController::Base
  include SessionsHelper
  private

  def require_user_logged_in
    unless logged_in?
      flash[:danger] = "You must be logged in to access this section"
      redirect_to login_url
    end
  end
end