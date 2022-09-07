class Public::ItemsController < ApplicationController
  layout 'public/layouts/application'  #layoutを宣言
   before_action :redirect_root, except: [ :index, :show]
  def search
        if params[:name].present?
            @items = Item.where('name LIKE ?', "%#{params[:name]}%")
        else
            @items = Item.none
        end
  end
  
  def index
    if params[:name].present?
      @items = Item.where('name LIKE ?', "%#{params[:name]}%").page(params[:page]).per(8)
    elsif params[:name].present?
      @items = Item.none.page(params[:page]).per(8)
    else
      @items = Item.page(params[:page]).per(8)
    end
  end
  

  def show
    @item = Item.find(params[:id])
    @customer = current_customer
    @cart_item = CartItem.new
    @genres = Genre.all
  end
  
  private
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:genre_id,:is_active)
  end
end
