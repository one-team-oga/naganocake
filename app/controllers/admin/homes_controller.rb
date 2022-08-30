class Admin::HomesController < ApplicationController
  layout 'admin/layouts/application'  #layoutを宣言
  
  def top
    @orders = Order.page(params[:page])
    ##@cart_items = CartItems.all
    
    ##@cart_item_amount= @cart_items.inject(0) { |result, item| sum + item.amount_total }
    
  end

end
