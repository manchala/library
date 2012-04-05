class UsersController < ApplicationController
  
  def show
      @user = User.find(params[:id])
  end
     
  def index
    @users = User.all
  end  
  
  def new
    @user = User.new
  end
  
  def edit
      @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      # Handle a successful update.
    else
      render 'edit'
    end
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
