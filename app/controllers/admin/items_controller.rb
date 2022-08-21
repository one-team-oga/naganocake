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
  end

  def edit
  end
  
  private
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:genre_id)
  end
end
