class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/layouts/application'  #layoutを宣言

  def show
    @order = Order.find(params[:id])
    @ordering_details = OrderingDetail.all.where(id: params[:id])
    @ordering_detail = OrderingDetail.find(params[:id])
  end
  
  def index
    @orders = Order.page(params[:page])
  end
  
  def update
    @order = Order.find(params[:id])
    @ordering_details = OrderingDetail.all.where(id: params[:id])
    @ordering_detail = OrderingDetail.find(params[:id])
    if  @order.update(order_params)
      redirect_to admin_orders_path
    else
      render :show
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:payment, :delivery_postal_code, :delivery_address, :delivery_name, :postage, :total_payment, :customer_id, :order_status)
  end
end
