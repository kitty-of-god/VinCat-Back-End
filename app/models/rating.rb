# == Schema Information
#
# Table name: ratings
#
#  id            :integer          not null, primary key
#  comment       :string
#  kind          :string
#  rating        :integer
#  rateable_id   :integer
#  rateable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Rating < ApplicationRecord
  belongs_to :rateable, polymorphic: true, optional: true

  
  validates :comment,
  length: { maximum: 200},
  presence: true

  validates :rating,
  numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5, only_integer: true},
            presence: true
end
