class User < ApplicationRecord
  has_many :products
  has_and_belongs_to_many :sales
  has_many :reports , as::repo
  has_many :ratings, as::rate
  has_and_belongs_to_many :chat
  has_and_belongs_to_many :messages, through: chat
  has_one :cart
  has_one :image, as::imag

  validates :username, :name, :description, :password, :residence, presence: true
end
