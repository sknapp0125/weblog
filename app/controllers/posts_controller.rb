class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

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

  # edit post
  def edit
    @post = Post.find(params[:id])
  end

  # update post
  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :body))
      redirect_to @post
    else
      render 'edit'
    end
  end

  # delete post
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end



  private
  def post_params
    params.require(:post).permit(:title, :body)
  end

end
