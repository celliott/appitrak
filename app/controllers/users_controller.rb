class UsersController < ApplicationController
  
  before_filter :confirm_logged_in, :except => [:new, :create, :login, :attempt_login, :logout]
   
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      session[:email] = @user.email
      session[:name] = @user.name
      session[:first_name] = @user.first_name
      flash[:notice] = "Thank you for signing up #{@user.first_name}!"
      redirect_to root_url 
    else
      render("new")
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User updated.'
      redirect_to(:action => 'list')
    else
      render("edit")
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:notice] = "User removed."
    redirect_to(:action => 'list')
  end
  
end