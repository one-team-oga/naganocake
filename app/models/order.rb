class Order < ApplicationRecord
    belongs_to :customer
    has_many :ordering_details, dependent: :destroy
end
