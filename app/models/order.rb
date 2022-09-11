class Order < ApplicationRecord
    belongs_to :customer
    has_many :ordering_details, dependent: :destroy
    
    validates :delivery_postal_code, presence: true
    validates :delivery_address, presence: true
    validates :delivery_name, presence: true
    validates :payment, presence: true
    
    enum payment: { credit: 0, bank: 1 }
    enum order_status: { payment_waiting: 0, payment_confirmation: 1, in_production: 2, preparing_delivery: 3, delivered: 4 }
    
end
