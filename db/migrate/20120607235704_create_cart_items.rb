class CreateCartItems < ActiveRecord::Migration
  def change
    create_table :cart_items do |t|
      t.integer :book_id
      t.integer :cart_id
      t.float 	:unit_price
      t.integer	:quantity

      t.timestamps
    end
  end
end
