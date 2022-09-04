class Admin::OrderingDetailsController < ApplicationController
  before_action :authenticate_admin!

def update
    @ordering_detail = OrderingDetail.find(params[:id])
    @order = @ordering_detail.order.id
    
    if  @ordering_detail.update(ordering_detail_params)
      redirect_to admin_order_path(@order)
    else
      render :show
    end
    
    
end

private

def ordering_detail_params
    params.require(:ordering_detail).permit(:order_id, :item_id, :price, :amount, :production_status)
end
  
end
