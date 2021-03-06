# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string
#  name                   :string
#  description            :string           default("")
#  residence              :string           default("")
#  role                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  authentication_token   :string(30)
#  provider               :string
#  uid                    :string
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :username, :description
  has_many :products
  has_many :ratings
  has_many :images
end
