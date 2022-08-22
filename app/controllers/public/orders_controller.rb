class Public::OrdersController < ApplicationController
  layout 'public/layouts/application'  #layoutを宣言
  def new
  end

  def complete
  end

  def index
     @ordering_details = OrderingDetail.page(params[:page])
  end

  def show
    
  end
end
