class EndUsers::CartItemsController < ApplicationController

  def index
    @cart_items = current_end_user.cart_items
    @sum = 0
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to request.referer
  end

  def destro
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to request.referer
  end

  def destroy_all
    current_end_user.cart_items.destroy_all
    redirect_to request.referer
  end

  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.end_user_id = current_end_user.id
    if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      cart_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
      cart_item.quantity += params[:cart_item][:quantity].to_i
      cart_item.save
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :quantity)
  end

end
