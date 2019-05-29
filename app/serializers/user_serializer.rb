class UserSerializer < ActiveModel::Serializer
  attributes :username, :name, :description, :password_digest, :residence, :role, :email
end
