class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  layout 'public/layouts/application'  #layoutを宣言
  
  def index
    @address = Address.new
    @customer = current_customer
    @addresses = current_customer.addresses
  end
  
  def create
    @address = Address.new(address_params)
    @customer = current_customer
    @addresses = current_customer.addresses
    
    if @address.save
      redirect_to addresses_path
    else
      render :index
    end
  end
  
  def edit
    @address = Address.find(params[:id])
    @customer = current_customer
  end
  
  def update
    @address = Address.find(params[:id])
    @customer = current_customer
    if @address.update(address_params)
      redirect_to addresses_path
    else
      render :edit
    end
  end
  
  def destroy
    @address = Address.find(params[:id])  
    @address.destroy
    redirect_to addresses_path
  end
 
 private
  def address_params
    params.require(:address).permit(:name,:postal_code,:address,:customer_id)
  end
end
