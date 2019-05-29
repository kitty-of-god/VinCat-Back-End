class RatingSerializer < ActiveModel::Serializer
  attributes :comment, :kind, :rating, :rateable_id, :rateable_type
end
