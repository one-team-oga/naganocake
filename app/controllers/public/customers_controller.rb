class Public::CustomersController < ApplicationController
  layout 'public/layouts/application'  #layoutを宣言
  def show
    @customer = current_customer
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def unsubcribe
  end
end
