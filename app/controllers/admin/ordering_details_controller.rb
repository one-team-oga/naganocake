class Admin::OrderingDetailsController < ApplicationController
  before_action :authenticate_admin!

def update
    @order = Order.find(params[:id])
    @ordering_details = OrderingDetail.all.where(id: params[:id])
    @ordering_detail = OrderingDetail.find(params[:id])
    if  @ordering_detail.update(ordering_detail_params)
      redirect_to admin_orders_path
    else
      render :show
    end
end

private

def ordering_detail_params
    params.require(:ordering_detail).permit(:order_id, :item_id, :price, :amount, :production_status)
end
  
end
