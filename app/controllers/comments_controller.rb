class CommentsController < ApplicationController
  before_action :logged_in?

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

  def logged_in?
    if current_user.nil?
      redirect_to '/signup', notice: "会員登録してください"
    end
  end
end
