class ImageSerializer < ActiveModel::Serializer
  attributes :name, :imageable_id, :imageable_type
end
