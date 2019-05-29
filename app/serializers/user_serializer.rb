# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  name            :string
#  description     :string
#  password_digest :string
#  residence       :string
#  role            :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  email           :string
#

class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :password
end
