class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  layout "admin/layouts/application"  # layoutを宣言

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to admin_customer_path(customer.id)
    else
      render :edit
    end
  end

private
  def customer_params
    params.require(:customer).permit(:firsr_name, :last_name, :first_name_kana, :last_name_kana, :postal_code, :address, :telephone_number, :email, :is_deleted)
  end
end
