class Public::CartItemsController < ApplicationController
  layout "public/layouts/application"  # layoutを宣言
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items
    @total_price = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
      # 元々カート内にあるもの「item_id」　
      # 今追加した　　　　　　　params[:cart_item][:item_id])
      @cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
      @cart_item.amount += params[:cart_item][:amount].to_i
      # cart_item.quantityに今追加したparams[:cart_item][:quantity]を加える
      # .to_iとして数字として扱う
      @cart_item.save
      redirect_to cart_items_path
    # もしカート内に「同じ」商品がない場合は通常の保存処理
    elsif @cart_item.save
      @cart_items = current_customer.cart_items.all
      redirect_to cart_items
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    if  @cart_item.update(cart_item_params)
      redirect_to cart_items_path
    else
      render :index
    end
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  private
    def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount, :customer_id)
    end
end
