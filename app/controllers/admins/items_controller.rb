class Admins::ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def index
    @items = Item.all.page(params[:page]).per(10)
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admins_items_path(@item)
  end

  def show
  end

  def edit
  end

  def update
  end

  private

  def item_params
    params.permit(:product_image_id, :name, :item_description, :genre_id, :price)
  end
end
