class RemoveColumnUserIdFromCategoriesTable < ActiveRecord::Migration[6.0]
  def change
  end
  change_column :product_categories, :like, :integer
end
