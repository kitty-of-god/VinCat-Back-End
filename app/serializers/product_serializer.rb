class ProductSerializer < ActiveModel::Serializer
  attributes :name, :description, :price, :quantity, :kind, :gender, :state, :new, :user_id, :sale_id

  belongs_to :user, optional: true
  belongs_to :sale, optional: true
  belongs_to :cart, optional: true
  has_many :ratings, as: :rateable, dependent: :destroy
  has_many :reports, as: :reportable
  has_many :images, as: :imageable, dependent: :destroy
  has_and_belongs_to_many :tags
  has_and_belongs_to_many :carts
  validates :name,
  format: { with: /\A[\w\s]+\z/, message: "only allows numbers, letters and spaces" },
  length: { in: 2..25},
  presence: true

  validates :description,
            length: { maximum: 200},
            presence: true

  validates :price,
  numericality: { greater_than: 0},
  presence: true

  validates :kind,
  format: { with: /\A[\w]+\z/, message: "only allows numbers, letters" },
  length: { in: 2..25},
  presence: true

  validates :state,
            :inclusion => { :in => [true, false] }

  validates :quantity,
  numericality: { greater_than: 0},
  presence: true

  validates :new,
            :inclusion => { :in => [true, false] }

  validates :gender,
            format: { with: /\A[a-zA-Z]+\z/, message: "Incorrect format"},
            length: { in: 2..25},
            presence: true
end
