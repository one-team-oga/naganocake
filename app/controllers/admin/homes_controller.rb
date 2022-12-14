class Admin::HomesController < ApplicationController
  layout "admin/layouts/application"  # layoutを宣言

  def top
    @orders = Order.page(params[:page]).order("created_at DESC")
    @cart_items = CartItem.all
  end
end
