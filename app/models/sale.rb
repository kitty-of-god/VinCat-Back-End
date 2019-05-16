class Sale < ApplicationRecord
 has_one :seller_user, class_name: 'User', foreign_key: 'seller_user_id'
 has_one :buyer_user, class_name: 'User', foreign_key: 'buyer_user_id'
  validates :date, :conf_seller, :conf_buyer, presence: true
end
