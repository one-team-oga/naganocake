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
  
  def withdraw
    @customer = current_customer
    # is_deletedカラムをtrueに変更することにより削除フラグを立てる
    @customer.update(is_deleted: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
    def customer_params
      params.require(:customer).permit( :first_name,:last_name, :first_name_kana, :last_name_kana,:email, :postal_code, :address, :telephone_number)
    end  
end
