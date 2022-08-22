class Admin::OrdersController < ApplicationController
layout 'admin/layouts/application'  #layoutを宣言

  def show
    @order = Order.find(params[:id])
  end
  
end
