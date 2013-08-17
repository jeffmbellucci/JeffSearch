class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:show, :index, :destroy]
  before_filter :correct_user, only: [:show, :index, :destroy]
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Account created."
      login(@user)
      redirect_to searches_url
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  def index
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to root_url
  end
  
end