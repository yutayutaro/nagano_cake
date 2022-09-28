class Order < ApplicationRecord
    belongs_to :customer
    has_many :order_products
    has_many :items,through: :order_products
   enum payment_method: {credit_card: 0, transfer: 1} 
    def order_address
    '〒' + postal_code + '\n' + address + '\n' + name
    end
end
