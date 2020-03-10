class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])
    if user &.authenticate(params[:password])
      login user
      render html: "logged"
    else
      render 'new'
    end    
  end

 
end
