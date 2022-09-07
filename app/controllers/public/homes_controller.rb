class Public::HomesController < ApplicationController
  layout 'public/layouts/application'  #layoutを宣言
  def top
    @genres = Genre.all
  end

  def about
  end
end
