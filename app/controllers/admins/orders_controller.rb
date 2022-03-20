class Admins::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details.all
    @total = @order_details.inject(0) { |sum, item| sum + item.subtotal }
    @postage = @order.postage
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      if order_params[:status] == "confirm_deposit"
        @order.order_details.update_all(making_status: 1)
      end
      redirect_to admin_order_path(@order)
    else
      @order_details = @order.order_details.all
      @total = @order_details.inject(0) { |sum, item| sum + item.subtotal }
      @postage = @order.postage
      render :show
    end
  end

  def customer_index
    @end_user = EndUser.find(params[:id])
    @orders = @end_user.orders.page(params[:page])
  end

  private
  def order_params
    params.require(:order).permit(:status)
  end
end
