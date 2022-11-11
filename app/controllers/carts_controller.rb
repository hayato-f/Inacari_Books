class CartsController < ApplicationController

  def index

    cart_logics
  end
  def create

    session[:cart] = [] if session[:cart].nil? #session[:cart]に値がなければ、インスタンスを作成。
    session[:cart] << params[:book_id] #=>session[:user_id][:book_id]はエラーになる。なんで？
    if session[:cart].size - session[:cart].uniq.count > 0  #カートに同じIdの商品があった場合
      session[:cart].uniq!  #同じIdの商品は取り除く
      flash[:cart_uniq] = "この商品はカートに追加済みです！！"
    end
     
    if cart_logics
      # flash[:carts_success] = "カートに追加しました" ＝＞　jsでカート機能作るなら、flashメッセージ追加する
      redirect_to carts_path
    end
    # @cart_books = Book.find_by(id: session[:cart])
  end

end
