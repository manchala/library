class UsersController < ApplicationController
  
  def show
      @user = User.find(params[:id])
  end
      
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
     flash[:success] = "Welcome to the Library App!" 
     redirect_to @user
    else
      flash[:failure] = "Sorry. Try again"
      render 'new'
    end
  end

end