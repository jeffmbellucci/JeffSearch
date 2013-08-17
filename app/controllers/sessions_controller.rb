class SessionsController < ApplicationController
  def new
     render :new
   end
  
   def create
     @user = User.find_by_username_and_password(params[:session][:username], 
                                            params[:session][:password])
     if @user
       flash[:success] ="Welcome back, #{@user.username}"
       login(@user)
       redirect_to searches_url
     else
       flash[:fail] = "You blew it on the name/password thing"
       render :new
     end
   end
  
   def destroy
     flash[:success] = "Successfully signed out"
     logout
     redirect_to root_url
   end
  
 end
