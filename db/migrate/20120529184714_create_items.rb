class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer, :book_id
      t.integer, :cart_id
      t.string :title
      t.text :description
      t.decimal :price
      t.string :image_url

      t.timestamps
    end
  end
end
