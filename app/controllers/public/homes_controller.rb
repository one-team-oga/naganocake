class Public::HomesController < ApplicationController
  layout "public/layouts/application"  # layoutを宣言
  def top
    @genres = Genre.all
    @items = Item.order("id DESC").limit(4)
  end

  def about
  end
end
