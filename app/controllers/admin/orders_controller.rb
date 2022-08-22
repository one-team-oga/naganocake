class Admin::OrdersController < ApplicationController
layout 'admin/layouts/application'  #layoutを宣言

  def show
    @ordering_details = OrderingDetail.page(params[:page])
  end
  
end
