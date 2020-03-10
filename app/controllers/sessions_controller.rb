class SessionsController < ApplicationController
  include SessionsHelper
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
       login user
       remember user
      render html: session[:remember_token]
    else
      render 'new'
    end    
  end

 
end
