class Sale < ApplicationRecord
 has_one :seller_user, class_name: 'User', foreign_key: 'seller_user_id'
 has_one :buyer_user, class_name: 'User', foreign_key: 'buyer_user_id'
  
  validates :date,
  presence: true
  
  validates :confirm_seller, #esto es bool
  presence: true
  
  validates :confirm_buyer, #esto es string
  inclusion: { in: %w(espera recibido), message: "%{value} no es un valor permitido" },
  presence: true
end
