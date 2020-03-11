class PostsController < ApplicationController
  before_action :allow_posts, only: %i[new create]

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      flash.now[:danger] = 'Please submit the post again'
      render :new
    end
  end

  def allow_posts
    redirect_to new_session_path unless logged?
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :author_id)
  end
end
