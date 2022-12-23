class Item < ApplicationRecord
  has_one_attached :image
  has_many :cart_items, dependent: :destroy
  has_many :ordering_details, dependent: :destroy
  belongs_to :genre

  validates :name, presence: true
  validates :introduction, presence: true
  validates :genre_id, presence: true
  validates :price, presence: true
  ## 消費税を求めるメソッド
  def add_tax_price
    (self.price * 1.10).floor
  end
  
  def search
    if params[:name].present?
      @items = Item.where("name LIKE ?", "%#{params[:name]}%")
    else
      @items = Item.none
    end
  end
end
