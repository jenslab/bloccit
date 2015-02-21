 class CommentsController < ApplicationController
   def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved!"
    else
      flash[:error] = "Ooops, couldn't save your comment. Please try again."
    end
   end

   private

   def comment_params
    params.require(:comment).permit(:body)
  end
 end