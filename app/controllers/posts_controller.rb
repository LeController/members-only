class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  # GET /posts
  def index
    @posts = Post.all
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @user = current_user
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end

  end

  private 

    def post_params
      params.require(:post).permit(:title, :body, :user_id)
    end

end
