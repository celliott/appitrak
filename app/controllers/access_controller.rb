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
       session[:email] = authorized_user.email
       session[:name] = authorized_user.name
       session[:first_name] = authorized_user.first_name
       flash[:notice] = "Welcome back #{authorized_user.first_name.capitalize}!"
       redirect_to root_url 
     else
       flash[:notice] = "Invalid username/password combination. "
       redirect_to(:action => 'login')
     end
   end

   def logout
     session[:user_id] = nil
     session[:email] = nil
     session[:name] = nil
     flash[:notice] = "Goodbye #{session[:first_name].capitalize}."
     session[:first_name] = nil
     redirect_to root_url
   end

end