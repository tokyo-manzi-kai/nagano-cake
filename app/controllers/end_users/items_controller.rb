class EndUsers::ItemsController < ApplicationController
  before_action :authenticate_end_user!, except: [:top, :about, :index]

  def index
    @genres = Genre.all
    @items = Item.all
    if params[:genre_id] != nil
      @items = @items.where(genre_id: params[:genre_id])
    end
    @items = @items.where(is_active: "true").page(params[:page]).per(8)
  end

  def show
    @genres = Genre.all
    @items = Item.find(params[:id])
    @cart_items = CartItem.new
  end

 private

end
