class Category < ApplicationRecord
    validates :name, presence: true, length: { minimum: 3, maximum: 25 }
    validates_uniqueness_of :name
    has_many :product_categories
    has_many :products, through: :product_categories
    
    accepts_nested_attributes_for :product_categories
  end