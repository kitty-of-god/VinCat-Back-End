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

class RatingSerializer < ActiveModel::Serializer
  attributes :comment, :kind, :rating, :rateable_id, :rateable_type
end
