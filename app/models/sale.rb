class Sale < ApplicationRecord
  has_one :user
  has_one :user
  
  validates :date,
  presence: true
  
  validates :confirm_seller, #esto es bool
  presence: true
  
  validates :confirm_buyer, #esto es string
  inclusion: { in: %w(espera recibido), message: "%{value} no es un valor permitido" },
  presence: true
end
