class User < ApplicationRecord
  has_many :products
  has_and_belongs_to_many :sales
  has_many :reports , as: :reportable
  has_many :ratings, as: :rateable
  has_and_belongs_to_many :chat
  has_and_belongs_to_many :messages, through: chat
  has_one :cart
  has_one :image, as: :imageable

  
  validates :username, 
  format: { with: /\A[a-zA-Z\s]+\z/, message: "only allows letters and spaces" },
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
  format: { with: /\A[.]+\z/, message: "Incorrect format"},
  length: { minimum: 3}, 
  presence: true
  
  validates :residence,
  format: { with: /\A[a-zA-Z\s]+\z/, message: "Incorrect format"}, 
  length: {minimum: 1},
  presence: true
  
  validates :type,
  inclusion: { in: %w(admin tienda natural), message: "%{value} no es un valor permitido" },
  presence: true
  
  validates :gender,
  format: { with: /\A[a-zA-Z]+\z/, message: "Incorrect format"},
  length: { in: 2..25},
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