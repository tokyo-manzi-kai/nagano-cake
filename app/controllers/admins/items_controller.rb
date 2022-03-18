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
    redirect_to admin_item_path(@item)
  end

  def show
  end

  def edit
  end

  def update
  end
end
