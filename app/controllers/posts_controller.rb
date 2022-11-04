class PostsController < ApplicationController
  load_and_authorize_resource

  def index
    @user = User.includes(posts: [:comments]).find(params[:user_id])
    @posts = @user.posts
    @current_user = current_user
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      @post.update_posts_counter
      flash[:success] = 'Post deleted successfully'
    else
      flash[:error] = 'Something went wrong'
    end

    redirect_to user_posts_path
  end

  def show
    @post = Post.includes(:comments, :likes).find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @user = current_user
    @post.user = @user
    # @post.user_id = current_user.id

    if @post.save
      redirect_to user_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
