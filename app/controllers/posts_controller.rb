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
  end

  # POST /posts
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user

    if @post.save
      redirect_to @post
    else
      render :new, status: :unprocessable_entity
    end

  end

  private 

    def post_params
      params.require(:post).permit(:title, :body)
    end

end
