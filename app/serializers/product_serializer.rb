class ProductSerializer < ActiveModel::Serializer
  attributes :name, :description, :price, :quantity, :kind, :gender, :state, :new, :user_id, :sale_id
end
