class Book < ApplicationRecord
  has_many :book_authors
  has_many :reviews, dependent: :destroy
  has_many :authors, through: :book_authors
  has_and_belongs_to_many :genres
  has_one_attached :photo

  validates :name, presence: true, length: { maximum: 255 }
  validates :photo, content_type: {
    in: ["image/jpeg", "image/png"],
    message: "Only accept images in jpeg and png format"
  }, size: {
    less_than: 5.megabytes,
    message: "Only accept images less than 5mb"
  }
  validates :description, length: { maximum: 5000 }
end
