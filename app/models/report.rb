class Report < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :rating
  
  validates :body, :type, presence: true
end
