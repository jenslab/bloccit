 class CommentsController < ApplicationController
   
   def create
    @post = Post.find(params[:post_id])
    @comment = current_user.comments.new(comment_params)
    @comment.post = @post
    @new_comment = Comment.new

    authorize @comment

    if @comment.save
      flash[:notice] = "Comment was saved!"
      redirect_to [@post.topic, @post]
    else
      flash[:error] = "Ooops, couldn't save your comment. Please try again."
      redirect_to [@post.topic, @post]
    end
   end

     def destroy
     @post = Post.find(params[:post_id])
     @comment = @post.comments.find(params[:id])
     
     authorize @comment

     if @comment.destroy
       flash[:notice] = "Comment was removed."
     else
       flash[:error] = "Comment couldn't be deleted. Try again."
     end

      respond_to do |format|
       format.html
       format.js
     end
   end

   private

   def comment_params
    params.require(:comment).permit(:body)
  end
 end