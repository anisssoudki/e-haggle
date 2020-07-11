class ProductCategories < ActiveRecord::Migration[6.0]
  def change
    remove_column :product_categories, :user_id
  end
end
