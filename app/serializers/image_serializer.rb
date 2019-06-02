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
#

class ImageSerializer < ActiveModel::Serializer
  attributes :name, :imageable_id, :imageable_type
end
