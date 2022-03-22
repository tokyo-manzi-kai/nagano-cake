class Admins::CustomersController < ApplicationController


  def index
    @end_users = EndUser.page(params[:page]).per(10)
  end

  def show
    @end_user = EndUser.find(params[:id])
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(customer_params)
      redirect_to admins_customers_path
    else
      render :edit
    end
  end

  private
  def customer_params
    params.require(:end_user).permit(:first_name, :last_name, :first_name_kana, :last_name_kana, :post_code, :address, :phone_number, :email, :is_deleted )
  end
end
