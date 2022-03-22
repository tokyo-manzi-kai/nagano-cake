class Admins::OrderDetailsController < ApplicationController
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order
    if @order_detail.update(order_detail_params)
      if order_detail_params[:production_status] == "in_production"
        @order_detail.update(production_status: 2)
      end

      if @order.order_details.all? {|order_detail| order_detail.production_status == "complete_production"}
        @order_detail.update(status: 3)
      end
      redirect_to admins_order_path(@order)
    else
      @order_details = OrderDetail.all
      @total = @order_details.inject(0) { |sum, item| sum + item.subtotal }
      @postage = @order.postage
      render 'admin/order/show'
    end
  end

  private
  def order_detail_params
    params.require(:order_detail).permit(:production_status)
  end
end