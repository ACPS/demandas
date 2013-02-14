class SessionsController < ApplicationController
  def new
  end
    
  def create  
    @user =  User.find_by_email(params[:email])
   
    if not @user.nil? and @user.password== params[:password] 
      session[:user] = @user  
      
                 
        
          redirect_to home_index_path
        
      
    else  
      flash.now.alert = "Email o password invalido"
      render "new"  
    end  
  end
  
  def destroy  
    session[:user] = nil  
    redirect_to root_url, :notice => ""  
  end   
end
