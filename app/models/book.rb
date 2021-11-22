class Book < ApplicationRecord
  has_many :authors, through: :book_authors
  has_and_belongs_to_many :genres
end
