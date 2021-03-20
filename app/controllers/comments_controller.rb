class CommentsController < ApplicationController
  def create
    @shoe = Shoe.find(params[:shoe_id])
    @comment  = @shoe.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    @new_comment = Comment.new
  end



  def destroy
    @shoe = Shoe.find(params[:shoe_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    @new_comment = Comment.new
  end

   private

  def comment_params
    params.require(:comment).permit(:comment, :shoe_id, :user_id)
  end
end
