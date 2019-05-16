class Report < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :rating
  
  validates :body,
  length: { maximum: 200},
  presence: true
  
  validates :type, #no definido
  presence: true
end
