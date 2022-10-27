class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to root_path, notice: "「#{@book.title}」を登録しました。"
    else
      render :new
    end
  end

  def show
    @book = Book.find_by(id: params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def book_params
    params.require(:book).permit(:title, :product_condition, :description, :price, :postage, :published, :seller_id)
  end

end
