class SaleSerializer < ActiveModel::Serializer
  attributes :date, :confirm_seller, :confirm_buyer, :seller_id, :buyer_id
end
