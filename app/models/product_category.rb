class ProductCategory < ApplicationRecord
    belongs_to :product
    belongs_to :category
    belongs_to :user
    accepts_nested_attributes_for :category
  end