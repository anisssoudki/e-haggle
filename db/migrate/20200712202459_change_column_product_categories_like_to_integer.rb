class ChangeColumnProductCategoriesLikeToInteger < ActiveRecord::Migration[6.0]
  def change
    remove_column :product_categories, :like, :boolean
    add_column :product_categories, :like, :integer,  default: 0 
  end
end
