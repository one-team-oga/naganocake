class Public::ItemsController < ApplicationController
  layout 'public/layouts/application'  #layoutを宣言
   before_action :redirect_root, except: [ :index, :show]
  def index
    @items = Item.page(params[:page]).per(8)
  end
  

  def show
    @item = Item.find(params[:id])
    @customer = current_customer
    @cart_item = CartItem.new
  end
  
  private
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:genre_id,:is_active)
  end
end
