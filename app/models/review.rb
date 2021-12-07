class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :content, presence: true, length: { minimum: 80, maximum: 1000 }
  validates :rating, numericality: { only_integer: true, greater_than: 0, less_than: 6 }

  scope :rv_by_book, ->(id){where book_id: id}
end
