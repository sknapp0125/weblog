class PostsController < ApplicationController
  def index
    @posts = Post.all.order('created_at DESC')
  end

  # to create new posts
  def new
    @post = Post.new
  end

  # to save posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  # defining a post
  def show
    @post = Post.find(params[:id])
  end


  private
  def post_params
    params.require(:post).permit(:title, :body)
  end


end
