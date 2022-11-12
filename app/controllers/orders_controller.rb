class OrdersController < ApplicationController
  
  def new
    cart_logics
    @user = current_user
    @book = Book.all
    @order = Order.new
    @order_detail = OrderDetail.new
  end
  
  def create
    cart_logics
    @user = current_user
    @order = Order.new(order_params)
    # @order.attributes = (order_params)
    @order.buyer_id = current_user.id # @order.buyer = current_userと同義
    
    # books = 0
    # session[:cart].each do |book|
    #   book
    #   byebug
    # end

    if @order.save
      session[:cart] = nil
      render 'thanx'
    else
      # byebug
      @msg = @order.errors.full_messages
      render 'new'
    end
    
    # byebug
  end

    private
      def order_params
        params.require(:order).permit(:buyer_id, :shipping_address, :subtotal, :postage, :total_price, :payment_method)
      end
end
