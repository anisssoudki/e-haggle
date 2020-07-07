class Product < ApplicationRecord
    belongs_to :user
    has_many :product_categories
    has_many :categories, through: :product_categories
    validates :name, presence: true, length: { minimum: 6, maximum: 100 }
    validates :description, presence: true, length: { minimum: 10, maximum: 300 }
  end