class Cart < ApplicationRecord
  has_many :products, dependent: :destroy
  belongs_to :user, optional: true
end
