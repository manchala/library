class AddImgptrToBooks < ActiveRecord::Migration
  def change
    add_column :books, :imgptr, :string
  end
end
