class CartSerializer < ActiveModel::Serializer
  attributes :user_id

  has_and_belongs_to_many :products
  belongs_to :user, optional: true
end
