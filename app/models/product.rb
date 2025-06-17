class Product < ApplicationRecord
  monetize :price_cents, numericality: { greater_than_or_equal_to: 0 }

  validates :name, presence: true, length: { maximum: 255 }
  validates :code, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 10 }
end
