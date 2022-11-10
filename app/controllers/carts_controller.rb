class CartsController < ApplicationController

  def index
    cart_logics
  end
  def create

    session[:cart] = [] if session[:cart].nil? #session[:cart]に値がなければ、インスタンスを作成。
    session[:cart] << params[:book_id] #=>session[:user_id][:bokk_id]はエラーになる。なんで？
     
    if cart_logics
      # flash[:carts_success] = "カートに追加しました" ＝＞　jsでカート機能作るなら、flashメッセージ追加する
      redirect_to carts_path
    end
    # @cart_books = Book.find_by(id: session[:cart])
  end

end
