class RemoveColumnUserIdFromCategoriesTable < ActiveRecord::Migration[6.0]
  def change
  end
  remove_column :categories, :user_id, :integer
end
