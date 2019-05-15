class Product < ApplicationRecord
  belongs_to :user
  belongs_to :sale
  has_and_belongs_to_many :cart
  has_many :reports
  has_one :image
end
