class EndUsers::OrdersController < ApplicationController
  def new
    @order = Order.new
    @end_user = current_end_user
  end

  def comfilm
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    if params[:order][:address_option] == "0"
      @order.post_code = current_end_user.post_code
      @order.address = current_end_user.address
      @order.name = current_end_user.first_name + current_end_user.last_name
    elsif params[:order][:address_option] == "1"
      @order.post_code = ShippingAddress.find(params[:order][:address]).post_code
      @order.address = ShippingAddress.find(params[:order][:address]).address
      @order.name = ShippingAddress.find(params[:order][:address]).name
    else
    end
    @orders = current_end_user.orders
    @order.postage = 800
    @cart_items = current_end_user.cart_items
    @sum = 0
  end


  def create
    @order = Order.new(order_params)
    @order.end_user_id = current_end_user.id
    if @order.save
      cart_items = current_end_user.cart_items.all
      cart_items.each do |cart_item|
        order_detail = OrderDetail.new
        order_detail.item_id = cart_item.item_id
        order_detail.order_id = @order.id
        order_detail.amount = cart_item.amount
        order_detail.price = cart_item.subtotal
        order_detail.product_status = 0
        order_detail.save
        current_end_user.cart_items.destroy_all
      end
      redirect_to complete_orders_path
    else
      redirect_to root_path, notice:"必要事項を確認しもう一度お試しください"
    end
  end

  def index
    @orders = current_end_user.orders.all
  end

  def show
    @order = Order.find(params[:id])
  end

  private

  def order_params
    params.require(:order).permit(:address, :post_code, :name, :postage, :billing_amount, :method_of_payment, :order_status)
  end
end
