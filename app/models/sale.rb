class Sale < ApplicationRecord
  has_one :user
  has_one :user
  
  validates :date, :conf_seller, :conf_buyer, presence: true
end
