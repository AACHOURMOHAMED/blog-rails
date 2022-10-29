class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = current_user
    @like = Like.new(user_id: @user.id, post_id: @post.id)

    @post = Post.find(params[:post_id]) if @like.save
    redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
  end

  def like_params
    params.require(:like).permit(:post_id)
  end
end
