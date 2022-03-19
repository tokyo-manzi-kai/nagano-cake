class EndUsers::ItemsController < ApplicationController
  def index
    @items = Item.where(is_active: "true").page(params[:page]).per(8)
  end

  def show
    @items = Item.find(params[:id])
    @cart_items = CartItem.new
  end

end
