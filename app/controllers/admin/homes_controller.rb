class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/layouts/application'  #layoutを宣言
  
  def top
    @orders = Order.page(params[:page])
    @cart_items = CartItem.all
  end

end
