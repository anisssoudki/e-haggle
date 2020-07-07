class CreateProductCategory < ActiveRecord::Migration[6.0]
  def change
    create_table :product_categories do |t|
      t.boolean :like
      t.integer :product_id 
      t.integer :category_id 
      t.integer :user_id
      t.timestamps
    end
  end
end
