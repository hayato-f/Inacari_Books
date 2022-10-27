class CartsController < ApplicationController
  def index
    @books = []
    return unless session[:carts]
    @total = 0
    @postage = 0
    session[:carts].each do |cart|
      book = Book.find_by(id: cart['id'])
      @total += book.price
      @postage += book.postage
      @books.push(book)
    end
  end

  def create
    session[:carts] = [] unless session[:carts]
    # bookのIDと数量をもつハッシュ(今回は数量の管理はなしなので固定で1)
    book_hash = {
      'id' => cart_params[:book_id],
      'quantity' => 1
    }
    # すでにカートに入っている商品なら追加しない(数量を管理する場合は数量を更新する)
    session[:carts].each do |cart|
      return redirect_to request.referer, notice: 'すでにカートに追加済みです。' if cart['id'] == book_hash['id']
    end

    session[:carts].push(book_hash)
    redirect_to request.referer, notice: 'カートに追加しました'
  end

  def destroy
    book_id = cart_params[:book_id]
    session[:carts].delete_if do |cart|
      cart['id'] == book_id
    end
    redirect_to request.referer, notice: 'カートから削除しました'
  end

  private
  def cart_params
    params.require(:cart).permit(:book_id)
  end

end
