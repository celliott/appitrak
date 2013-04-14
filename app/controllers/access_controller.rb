class AccessController < ApplicationController

   def index
     render('login')
   end

   def login
     # login form
   end

   def attempt_login
     authorized_user = User.authenticate(params[:email], params[:pass])
     if authorized_user
       session[:user_id] = authorized_user.id
       if params[:remember_me][:remember] == '1'
         cookies.signed[:user_id] = { :value => authorized_user.id.to_s, :expires => 2.weeks.from_now }
       end  
       flash[:notice] = "Welcome back #{authorized_user.first_name.capitalize}!"
       redirect_to root_url 
     else
       flash[:notice] = "Invalid username/password combination. "
       redirect_to(:action => 'login')
     end
   end

   def logout
     if session[:user_id]
       session[:user_id] = nil       
     end
     if cookies[:user_id]
       cookies[:user_id] = nil
       cookies.delete :user_id 
     end 
     redirect_to root_url
   end

end