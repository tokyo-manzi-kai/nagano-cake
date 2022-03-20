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
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    redirect_to admins_item_path(@item)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :item_description, :genre_id, :price)
  end
end