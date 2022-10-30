class BooksController < ApplicationController
  def index
    @books = Book.published
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save!
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update!(book_params)
    redirect_to books_url, notice: "更新しました"
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
end
