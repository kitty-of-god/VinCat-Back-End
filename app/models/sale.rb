# == Schema Information
#
# Table name: sales
#
#  id             :integer          not null, primary key
#  date           :time
#  confirm_seller :boolean
#  confirm_buyer  :string
#  seller_user_id :integer
#  buyer_user_id  :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  seller_id      :integer
#  buyer_id       :integer
#

class Sale < ApplicationRecord
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
