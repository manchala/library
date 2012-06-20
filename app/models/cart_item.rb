class CartItem < ActiveRecord::Base
  attr_accessible :book_id, :cart_id, :unit_price, :quantity
  
  belongs_to :cart
  belongs_to :book
end
