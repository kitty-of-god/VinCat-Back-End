class User < ApplicationRecord
  has_many :products
  has_many :sales
  has_many :reports
  has_one :cart
end
