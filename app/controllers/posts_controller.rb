class PostsController < ApplicationController
  before_action :allow_posts, only: [:new, :create]

  def new; end

  def create

  end

  def allow_posts
    puts "logged:" + logged?.to_s
    redirect_to new_session_path unless logged?
  end



end
