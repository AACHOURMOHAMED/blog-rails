class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @post = Post.find(params[:post_id])
    @comment.post_id = @post.id

    if @comment.save
      redirect_to user_post_path(user_id: @post.user_id, id: @post.id)
      flash[:notice] = 'Comment successfully added!'
    else
      render :new
      flash[:alert] = 'Comment not submitted!'
    end
  end

  def comment_params
    params.require(:comment).permit(:text, :post_id)
  end
end
