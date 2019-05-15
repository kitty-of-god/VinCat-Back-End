class User < ApplicationRecord
  has_many :products
  has_many :sales
  has_many :reports
  has_many :ratings
  has_many :chat
  has_many :messages, through: chat
  has_one :cart
  has_one :image
  
  validates :username, :name, :description, :password, :residence, presence: true
end
