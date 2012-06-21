
class CartController < ApplicationController
  before_filter :initialize_cart
  
  def index
  end
  
  def add
    @book = Book.find(params[:id])

    if request.post?
      @cart_item = @cart.add(params[:id])
      flash[:cart_notice] = "Added <em>#{@cart_item.book.title}</em>"
      redirect_to :controller => "cart", :action => "show"
    else
      render
    end
  end # add method
  
  
  def remove
    @book = Book.find(params[:id])
    if request.xhr?
      @cart_item = @cart.remove(params[:id])
      flash[:cart_notice] = "Removed <em>#{@cart_item.book.title}</em>"
    elsif request.post?
      @cart_item = @cart.remove(params[:id])
      flash[:cart_notice] = "Removed <em>#{@cart_item.book.title}</em>"
      redirect_to :controller => "cart", :action => "show"
    else
      render
    end
  end # remove method
  
  
  def show
  end
  
  private
    def initialize_cart
      if session[:cart_id]
	@cart = Cart.find(session[:cart_id])
      else
	@cart = Cart.create
	session[:cart_id] = @cart.id
      end
    end

end
