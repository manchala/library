class OrderItem < ActiveRecord::Base
  attr_accessible :amount, :book_id, :order_id, :price
  belongs_to :order
  belongs_to :book
end
