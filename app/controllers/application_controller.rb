class ApplicationController < ActionController::Base
  helper_method :logged?

  def login(user)
    user.update_token
    cookies.permanent[:remember_token] = user.remember_token
    current_user
  end

  def current_user?(user)
    user && user == current_user
  end

  def current_user
    @current_user ||= User.find_by(remember_token: cookies[:remember_token])
  end

  def sign_out
    cookies.delete(:remember_token)
    @current_user = nil
  end

  def logged?
    !current_user.nil?
  end
end
