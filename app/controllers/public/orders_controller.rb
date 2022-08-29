class Public::OrdersController < ApplicationController
  layout 'public/layouts/application'  #layoutを宣言
  def new
    @customer = current_customer
    @order = Order.new
  end

  def complete
  end

  def index
    @orders = Order.page(params[:page])
  end

  def show
    
  end
  
  def create
    @cart_items = current_customer.cart_items.all
  end
  
  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_number] == "0"
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.first_name + current_customer.last_name 
    elsif params[:order][:address_number] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.delivery_postal_code = @address.postal_code
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name
    end
  
    @cart_items = current_customer.cart_items.all
    
   
    
  end
  
  private
  def order_params
    params.require(:order).permit(:payment, :delivery_postal_code, :delivery_address, :delivery_name)
  end
  
  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end
end
