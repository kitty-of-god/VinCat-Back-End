# == Schema Information
#
# Table name: images
#
#  id             :integer          not null, primary key
#  name           :string
#  imageable_id   :integer
#  imageable_type :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  photo          :string
#

class Image < ApplicationRecord
  belongs_to :imageable , polymorphic: true, optional: true
  mount_uploader :photo, PhotoUploader


  validates :name,
  format: { with: /\A[\S]+[.][\S]+\z/, message: "only allows letters and spaces" },
  length: { in: 2..30},
  presence: true
end
