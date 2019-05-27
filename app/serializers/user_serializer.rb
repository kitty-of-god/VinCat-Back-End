class UserSerializer < ActiveModel::Serializer
  attributes :username, :name, :description, :password_digest, :residence, :role, :email

  has_many :products, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :reports, as: :reportable
  has_many :ratings, as: :rateable, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :messages, through: :chats
  has_one :cart, dependent: :destroy
  has_one :image, as: :imageable, dependent: :destroy

  validates :username,
  format: { with: /\A[\S]+\z/, message: "only allows letters and spaces" },
  length: { in: 6..20},
  uniqueness: true,
  presence: true

  validates :name,
  format: { with: /\A[\w\s]+\z/, message: "only allows letters and spaces" },
  length: { in: 2..25},
  presence: true

  validates :description,
  length: { maximum: 200},
  presence: true

  validates :password,
  format: { with: /\A[\S]+\z/, message: "Incorrect format"},
  length: { minimum: 3},
  presence: true

  validates :residence,
  format: { with: /\A[a-zA-Z\s]+\z/, message: "Incorrect format"},
  length: {minimum: 1},
  presence: true

  validates :role,
  inclusion: { in: %w(admin tienda natural), message: "%{value} no es un valor permitido" },
  presence: true
end
