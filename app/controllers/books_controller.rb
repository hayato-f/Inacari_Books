class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit]
  before_action :unless_seller, only: [:edit]

  def index
    @books = Book.published
    if params[:title].present?
      @books = @books.keyword_search(params[:title])
    end
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @book.comments.order(created_at: :desc)
  end

  def edit
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_params)
    redirect_to root_path, notice: "更新しました"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to request.referer, notice: "削除しました"
  end

  private

  def book_params
    params.require(:book).permit(:seller_id, :title, :image, :product_condition, :description, :price, :postage, :published, :soldout, category_ids: [] )
  end

  def set_book
    @book = Book.find(params[:id])
  end

  def unless_seller
    unless current_user == @book.seller
      redirect_to root_path
    end
  end

end
