class Report < ApplicationRecord
  belongs_to :user
  belongs_to :product
  belongs_to :rating
end
