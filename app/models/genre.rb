class Genre < ApplicationRecord
  has_and_belongs_to_many :books

  validates :name, :unique =>  true, presence: true, length: { maximum: 255 }
end
