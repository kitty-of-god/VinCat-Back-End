# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  username               :string
#  name                   :string
#  description            :string
#  residence              :string
#  role                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  authentication_token   :string(30)
#

class User < ApplicationRecord
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :products, dependent: :destroy
  has_many :sales, dependent: :destroy
  has_many :reports, as: :reportable
  has_many :ratings, as: :rateable, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :messages, through: :chats
  has_one :cart, dependent: :destroy
  has_one :image, as: :imageable, dependent: :destroy
  
  #scopes
  scope :NameOrder, -> { order(name: :asc)}
  
=begin

  alias_method :authenticate, :valid_password?

  def self.from_token_payload(payload)
    self.find payload["sub"]
  end
  
=end

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
  length: { maximum: 200}

  validates :password,
  format: { with: /\A[\S]+\z/, message: "Incorrect format"},
  length: { minimum: 3},
  presence: true

  validates :role,
  inclusion: { in: %w(admin tienda natural), message: "%{value} no es un valor permitido" },
  presence: true
end

=begin

Dejo aquí una pequeña referencia de ReGex para el que necesite modificar el formato

[abc]	A single character of: a, b, or c
[^abc]	Any single character except: a, b, or c
[a-z]	Any single character in the range a-z
[a-zA-Z]	Any single character in the range a-z or A-Z
^	Start of line
$	End of line
\A	Start of string
\z	End of string
.	Any single character
\s	Any whitespace character
\S	Any non-whitespace character
\d	Any digit
\D	Any non-digit
\w	Any word character (letter, number, underscore)
\W	Any non-word character
\b	Any word boundary
(...)	Capture everything enclosed
(a|b)	a or b
a?	Zero or one of a
a*	Zero or more of a
a+	One or more of a
a{3}	Exactly 3 of a
a{3,}	3 or more of a
a{3,6}	Between 3 and 6 of a

=end
