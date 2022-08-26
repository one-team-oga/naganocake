class Order < ApplicationRecord
    belongs_to :customer
    has_many :ordering_details, dependent: :destroy
    
    enum payment: { credit: 0, bank: 1 }
    
end
