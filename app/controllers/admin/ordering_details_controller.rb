class Admin::OrderingDetailsController < ApplicationController
  before_action :authenticate_admin!

def update
    @ordering_detail = OrderingDetail.find(params[:id])
    @order = @ordering_detail.order
    @ordering_details = @order.ordering_details
    @ordering_detail.update(ordering_detail_params)
    
    if @ordering_details.where(production_status: "in_production").count >= 1
      @order.order_status = "in_production"
      @order.save
    end

    if @order.ordering_details.count == @ordering_details.where(production_status: "production_complete").count
      @order.order_status = "preparing_delivery"
      @order.save
    end
    redirect_to admin_order_path(@order)
    
end

private

def ordering_detail_params
    params.require(:ordering_detail).permit(:order_id, :item_id, :price, :amount, :production_status)
end
  
end
