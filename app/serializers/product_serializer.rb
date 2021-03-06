# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :string
#  price       :integer
#  quantity    :integer
#  kind        :string
#  gender      :string
#  state       :boolean          default(TRUE)
#  new         :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#  sale_id     :integer
#

class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :price, :quantity, :kind, :gender, :state, :new, :user_id, :sale_id
  has_many :tags
  has_many :ratings
  has_many :images
end
