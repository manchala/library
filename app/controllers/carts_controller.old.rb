
class CartsController < ApplicationController
  before_filter :initialize_cart
  
  def cindexy
    @cart = session[:cart] || {}
     @my_cart = Cart.find(session[:cart_id]) || {}
  end

  def add
    ## id = params[:id]
    ## cart = session[:cart] ||= {}
    ## cart[id] = (cart[id] || 0) + 1
    ## redirect_to :action => :index
    
    @book = Book.find(params[:id])

    if request.post?
      @cart_item = @cart.add(params[:id])
      flash[:cart_notice] = "Added <em>#{@cart_item.book.title}</em>"
      redirect_to :controller => "book"
    else
      render
    end
  end # add method
  
  def show
    
  end
  
end
