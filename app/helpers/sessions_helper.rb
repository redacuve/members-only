module SessionsHelper
  def login(user)
    session[:remember_token] = user.remember_token
  end
  def remember(user)
    cookies.permanent[:remember_token] = user.remember_token
  end
end
