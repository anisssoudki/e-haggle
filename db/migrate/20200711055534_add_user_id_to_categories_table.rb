class AddUserIdToCategoriesTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :categories, :user_id, :integer
  end
end
