class Public::OrdersController < ApplicationController
  layout 'public/layouts/application'  #layoutを宣言
  def new
    @customer = current_customer
  end

  def complete
  end

  def index
    @orders = Order.page(params[:page])
  end

  def show
    
  end
  
  def confirm
    @order = Order.new(order_params)
    # new 画面から渡ってきたデータを @order に入れます
    if params[:order][:address_number] == "1"
      # view で定義している address_number が"1"だったときにこの処理を実行します
      # form_with で @order で送っているので、order に紐付いた address_number となります。以下同様です
      # この辺の紐付けは勉強不足なので gem の pry-byebug を使って確認しながら行いました
      @order.name = current_customer.name # @order の各カラムに必要なものを入れます
       @order.address = current_customer.customer_address
    elsif params[:order][:address_number] == "2"
      # view で定義している address_number が"2"だったときにこの処理を実行します
      if Address.exists?(name: params[:order][:registered])
# registered は viwe で定義しています
        @order.name = Address.find(params[:order][:registered]).name
        @order.address = Address.find(params[:order][:registered]).address
      else
        render :new
# 既存のデータを使っていますのでありえないですが、万が一データが足りない場合は new を render します
      end
    elsif params[:order][:address_number] == "3"
      # view で定義している address_number が"3"だったときにこの処理を実行します
      address_new = current_customer.addresses.new(address_params)
      if address_new.save # 確定前(確認画面)で save してしまうことになりますが、私の知識の限界でした
      else
        render :new
# ここに渡ってくるデータはユーザーで新規追加してもらうので、入力不足の場合は new に戻します
      end
    end
  end
  
  private
  def order_params
    params.require(:order).permit(:payment,:postal_code, :address, :name)
  end
  
  def address_params
    params.require(:order).permit(:name, :address)
  end
end
