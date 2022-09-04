class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/layouts/application'  #layoutを宣言

  def show
    @order = Order.find(params[:id])
    @customer = @order.customer_id
    @ordering_details = @order.ordering_details
  end
  
  def index
    @customer = Customer.find(params[:customer_id])
    @orders = @customer.orders.page(params[:page])
  end
  
  def update
    @order = Order.find(params[:id])
    @ordering_details = @order.ordering_details
    @order.update(order_params)
    
    @ordering_details.each do |ordering_detail|
      if @order.order_status == "payment_confirmation"
        ordering_detail.update(production_status: "production_pending")
      end
    end
    
    
    redirect_to admin_order_path(@order)
    
  end
  
  private
  def order_params
    params.require(:order).permit(:payment, :delivery_postal_code, :delivery_address, :delivery_name, :postage, :total_payment, :customer_id, :order_status)
  end
  
  def ordering_detail_params
    params.require(:ordering_detail).permit(:order_id, :item_id, :price, :amount, :production_status)
  end
end
