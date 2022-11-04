class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    post = Post.find(params[:post_id])

    comment = Comment.new(comment_params)
    comment.user = current_user
    comment.post = post

    if comment.save
      redirect_to user_post_path(post.user_id, post.id)
      flash[:success] = 'Comment successfully added!'
    else
      render :new
      flash[:error] = 'Comment not submitted!'
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      @comment.update_comments_counter
      flash[:success] = 'Comment created successfully'
      redirect_to user_posts_path
    else
      flash[:error] = 'Something went wrong'
    end
  end

  private

  def comment_params
    params.require(:new_comment).permit(:text)
  end
end
