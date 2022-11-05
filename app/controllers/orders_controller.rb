class OrdersController < ApplicationController
  def index

    @cart_books = []    #モデルから、データを取り出し格納するためのインスタンス。
    @sub_total_price = 0   #料金の小計を格納するインスタンス。
    
    session[:cart].each do |cart_id|
      cart_book = Book.find_by(id: cart_id)  #session[:cart]と一致する商品Idをモデルから呼び出して変数に格納
      # session[:cart_book] = Book.find_by(id: cart_id)  #session[:cart]と一致する商品Idをモデルから呼び出して変数に格納
      @sub_total_price += cart_book.price   #商品の料金を足していき、小計を変数に格納。
      @total_price = @sub_total_price + cart_book.postage #商品の承継と送料を足して、合計金額を変数に格納。
      @cart_books << Book.find_by(id: cart_id) #sessionからIDを取り出し、対応するIdをモデルから取り出して、配列に入れる。
    end 
  end
end
