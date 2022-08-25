class Item < ApplicationRecord
    has_one_attached :image
    has_many :cart_items, dependent: :destroy
    has_many :ordering_details, dependent: :destroy
    belongs_to :genre
    
    ## 消費税を求めるメソッド
    def add_tax_price
        (self.price * 1.10).floor
    end
    
end
