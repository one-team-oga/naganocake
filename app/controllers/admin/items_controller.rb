class Admin::ItemsController < ApplicationController
  layout 'admin/layouts/application'  #layoutを宣言

  def index 
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    item = Item.new(item_params)
    item.save
    redirect_to admin_item_path(item.id)
  end

  def show
    @item = Item.find(params[:id])
    @is_active = @item.is_active ? "販売中" : "販売停止中"
  end

  def edit
  end
  
  private
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:genre_id,:is_active)
  end
end
