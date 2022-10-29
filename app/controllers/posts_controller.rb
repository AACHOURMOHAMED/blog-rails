class PostsController < ApplicationController
  def index
    @user = User.includes(:posts).find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    if @post.save
      redirect_to user_path(id: @post.user_id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
