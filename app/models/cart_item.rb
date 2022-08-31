class CartItem < ApplicationRecord
    belongs_to :customer
    belongs_to :item
    
    validates :amount, presence: true
    ## 小計を求めるメソッド
    def subtotal
        item.add_tax_price * amount
    end
    ## 商品の合計個数を求めるメソッド
    def amount_total
        sum = 0
        for i in item.amount do
            sum += i
        end
    end
    
end
