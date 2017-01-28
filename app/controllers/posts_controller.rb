class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(author_id: current_user.id, content: params[:post][:content])
    if @post.save
      flash[:success] = "Posted"
      redirect_to posts_path 
    else
      flash[:danger] = "Error encountered when posting"
      render 'new'
    end
  end

  def index
    @posts = Post.all
  end

  # Before filters
  #
  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in"
      redirect_to login_path
    end
  end

end
