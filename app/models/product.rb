class Product < ActiveRecord::Base
  monetize :price_cents, numericality: true
  mount_uploader :image, ProductImageUploader

  belongs_to :category
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true
  validates :quantity, presence: true
  validates :category, presence: true
  validates :image, presence: true
  validates :description, presence: true

end
