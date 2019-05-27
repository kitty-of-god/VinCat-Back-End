class SaleSerializer < ActiveModel::Serializer
  attributes :date, :confirm_seller, :confirm_buyer, :seller_id, :buyer_id

   belongs_to :seller
   belongs_to :buyer

   validates :date,
   presence: true

   validates :confirm_seller, #esto es bool
   presence: true

   validates :confirm_buyer, #esto es string
   inclusion: { in: %w(espera recibido), message: "%{value} no es un valor permitido" },
   presence: true
end
