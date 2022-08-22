class Admin::HomesController < ApplicationController
  layout 'admin/layouts/application'  #layoutを宣言
  
  def top
    @ordering_details = OrderingDetail.page(params[:page])
  end

end
