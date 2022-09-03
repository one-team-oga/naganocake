class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  layout 'admin/layouts/application'  #layoutを宣言

  def index
    @items = Item.page(params[:page])
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    @genres = Genre.all
    if @item.save
      redirect_to admin_item_path(item.id)
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
    @is_active = @item.is_active ? "販売中" : "販売停止中"
  end

  def edit
    @item = Item.find(params[:id])
    @genres = Genre.all
  end
  
  def update
    @item = Item.find(params[:id])
    @genres = Genre.all
    if @item.update(item_params)
     redirect_to admin_item_path(item.id)
    else
     render :edit
    end
  end
  
  private
  def item_params
    params.require(:item).permit(:name,:introduction,:price,:genre_id,:is_active)
  end
end
