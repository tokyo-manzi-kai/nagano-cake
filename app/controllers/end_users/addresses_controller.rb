class EndUsers::AddressesController < ApplicationController
  def index
    @end_user = current_end_user
    @shipping_addresses = @end_user.shipping_addresses.all
    @shipping_address = ShippingAddress.new
  end

  def create
    @shipping_address = ShippingAddress.new(shipping_address_params)
    @shipping_address.end_user_id = current_end_user.id
    if @shipping_address.save
      redirect_to addresses_path
    else
      @end_user = current_end_user
      @shipping_addresses = @end_user.shipping_addresses.all
      render :index
    end
  end

  def edit
    @shipping_address = ShippingAddress.find(params[:id])
  end

  def update
    @shipping_address = ShippingAddress.find(params[:id])
    if @shipping_address.update(shipping_address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end

  def destroy
    @shipping_address = ShippingAddress.find(params[:id])
    @shipping_address.destroy
    redirect_to addresses_path
  end

private

  def shipping_address_params
    params.require(:shipping_address).permit(:post_code, :address, :address_name)
  end
end
