class AddAuthorsToBooks < ActiveRecord::Migration
  def change
    add_column :books, :authors, :string
  end
end
