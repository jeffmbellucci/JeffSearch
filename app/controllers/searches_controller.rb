class SearchesController < ApplicationController
  include SearchesHelper
  
  before_filter :logged_in_user
  def new
      @search = Search.new
    end
  
  def create
    @search = Search.create(params[:search])
    if @search.save
      redirect_to search_url(@search)
    else
      render :new
    end
  end

  def index
    @searches = current_user.searches
  end

  def show
    @search = Search.find(params[:id])
  end

  def edit
     @search = Search.find(params[:id])
  end

  def update
   @search = Search.find(params[:id])
   if @search.update_attributes(params[:search])
     redirect_to search_url(@search)
   else
     render :edit
   end
  end
  
  def destroy
    @search = Search.find(params[:id])
    @search.destroy
    redirect_to searches_url
  end
end

