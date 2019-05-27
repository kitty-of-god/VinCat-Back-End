class ImageSerializer < ActiveModel::Serializer
  attributes :name, :imageable_id, :imageable_type

  belongs_to :imageable , polymorphic: true, optional: true

  validates :name,
  format: { with: /\A[\S]+[.][\S]+\z/, message: "only allows letters and spaces" },
  length: { in: 2..30},
  presence: true
end
