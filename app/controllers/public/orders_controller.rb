class Public::OrdersController < ApplicationController
  layout 'public/layouts/application'  #layoutを宣言
  def new
    @customer = current_customer
    @order = Order.new
  end

  def complete
    
  end

  def index
    @orders = Order.page(params[:page])
  end

  def show
    
  end
  
  def create
    @order = current_customer.orders.new(order_params)
    @cart_items = current_customer.cart_items.all
    
    @order.save
    
    @cart_items.each do |cart|
# 取り出したカートアイテムの数繰り返します
# order_item にも一緒にデータを保存する必要があるのでここで保存します
      ordering_detail = OrderingDetail.new
      ordering_detail.item_id = cart.item_id
      ordering_detail.order_id = @order.id
      ordering_detail.amount = cart.amount
      ordering_detail.price = cart.item.price
      ordering_detail.production_status = 0
# カート情報を削除するので item との紐付けが切れる前に保存します
      ordering_detail.save
    end
    redirect_to orders_complete_path
    @cart_items.destroy_all
  end
  
  def confirm
    @order = Order.new(order_params)
    @customer = current_customer
     
    if params[:order][:address_number] == "0"
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.first_name + current_customer.last_name 
    elsif params[:order][:address_number] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.delivery_postal_code = @address.postal_code
      @order.delivery_address = @address.address
      @order.delivery_name = @address.name
    else
      render :new
    end
  
    @cart_items = current_customer.cart_items.all
    
    @total = @cart_items.inject(0) { |sum, item| sum + item.subtotal }
    
    @customer_id = current_customer.id

  end
  
  private
  def order_params
    params.require(:order).permit(:payment, :delivery_postal_code, :delivery_address, :delivery_name, :postage, :total_payment, :customer_id, :order_status)
  end
  
  def ordering_detail_params
    params.require(:ordering_detail).permit(:order_id, :item_id, :price, :amount, :production_status)
  end
  
  def address_params
    params.require(:order).permit(:name, :address, :postal_code)
  end
end
