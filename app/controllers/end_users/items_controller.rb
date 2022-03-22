class EndUsers::ItemsController < ApplicationController
  before_action :authenticate_end_user!, except: [:top, :about, :index]

  def index
    @items = Item.where(is_active: "true").page(params[:page]).per(8)
  end

  def show
    @items = Item.find(params[:id])
    @cart_items = CartItem.new
  end

 private

end
