class ApplicationController < ActionController::Base
  include SessionsHelper
  
  def login(user)
    user.update_token
    cookies.permanent[:remember_token] = user.remember_token
  end
end
