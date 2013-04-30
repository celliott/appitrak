class UsersController < ApplicationController
  
  before_filter :confirm_logged_in, :except => [:new, :create, :login, :attempt_login, :logout]
     
  def new
    show_public_menu
    @user = User.new
  end

  def create
    show_public_menu
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      session[:email] = @user.email
      session[:name] = @user.name
      session[:first_name] = @user.first_name
      redirect_to habits_url 
    else
      render("new")
    end
  end
  
  def edit
    show_menu
    @user = User.find(current_user_id)
  end
  
  def update
    show_menu
    @user = User.find(current_user_id)
    if @user.update_attributes(params[:user])
      flash[:error] = 'Password updated.'
      redirect_to(:controller => 'settings')
    else
      render("edit")
    end
  end

  def delete
    show_menu
    @user = User.find(current_user_id)
    render("delete")
  end

  def destroy
    show_menu
    @user = User.find(current_user_id)
    if @user.email == params[:email][:delete_user]
      User.find(current_user_id).destroy
      session.delete :user_id 
      cookies.delete :user_id 
      cookies.delete :trend
      flash[:notice] = "User removed. Goodbye."
      redirect_to root_url
    else
      flash[:notice] = "Email does not match." 
      render("delete")
    end  
  end
  
end