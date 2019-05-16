class Image < ApplicationRecord
  belongs_to :imag , polymorphic: true

end
