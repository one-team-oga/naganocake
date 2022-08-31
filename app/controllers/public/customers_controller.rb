class Public::CustomersController < ApplicationController
  layout 'public/layouts/application'  #layoutを宣言
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  
  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to my_page_path
    else
      render :edit
    end
  end
  
  def unsubcribe
  end
  
  private
    def customer_params
      params.require(:customer).permit( :first_name,:last_name, :first_name_kana, :last_name_kana,:email, :postal_code, :address, :telephone_number)
    end  
end
