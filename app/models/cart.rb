class Cart < ActiveRecord::Base
  attr_accessible :quantity
  has_many :cart_items
  has_many :books, :through => :cart_items
  
  def add(book_id)
    items = cart_items.find_all_by_book_id(book_id)
    book = Book.find(book_id)
    
    if items.size < 1
      cartItem = cart_items.create(:book_id => book.id, :quantity => 1, :unit_price => book.price)
    else
      cartItem = items.first
      cartItem.update_attribute(:quantity, cartItem.quantity + 1)
    end
    cartItem
  end
  
  def remove(book_id)
    ci = cart_items.find_by_book_id(book_id)
    
    if ci.quantity > 1
      ci.update_attribute(:quantity, ci.quantity - 1)
    else
      CartItem.destroy(ci.id)
    end
    return ci
  end
    

  
  
  def total
    cart_items.to_a.sum(&:full_price)
  end

end