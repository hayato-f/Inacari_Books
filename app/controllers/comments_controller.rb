class CommentsController < ApplicationController
  def create
    book = Book.find(params[:book_id])
    comment = current_user.comments.new(comment_params)
    comment.user_id = current_user.id
    comment.save!
    
    redirect_to book_path(params[:book_id])
  end

  def destroy
    @book = Book.find(params[:book_id])
    @comment = Comment.find(params[:id])
    if @comment.destroy
      redirect_to book_path(@book)
    else
      flash.now[:alert] = 'コメント削除に失敗しました'
      render book_path(@book)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment, :user_id, :book_id)
  end
end
