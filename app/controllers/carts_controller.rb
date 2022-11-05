class CartsController < ApplicationController
  def index
    session[:cart] = [] if session[:cart].nil? #session[:cart]に値がなければ、インスタンスを作成。
    session[:cart] << params[:book_id] #=>session[:user_id][:bokk_id]はエラーになる。なんで？

    @cart_books = []    #モデルから、データを取り出し格納するためのインスタンス。
    @sub_total_price = 0   #料金の小計を格納するインスタンス。
    
    session[:cart].each do |cart_id|
      cart_book = Book.find_by(id: cart_id)  #session[:cart]と一致する商品Idをモデルから呼び出して変数に格納
      # session[:cart_book] = Book.find_by(id: cart_id)  #session[:cart]と一致する商品Idをモデルから呼び出して変数に格納
      @sub_total_price += cart_book.price   #商品の料金を足していき、小計を変数に格納。
      @total_price = @sub_total_price + cart_book.postage #商品の承継と送料を足して、合計金額を変数に格納。
      @cart_books << Book.find_by(id: cart_id) #sessionからIDを取り出し、対応するIdをモデルから取り出して、配列に入れる。
    end 
    # byebug
    # @cart_books = Book.find_by(id: session[:cart])
  end
end
