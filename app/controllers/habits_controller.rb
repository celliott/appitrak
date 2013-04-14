class HabitsController < ApplicationController
  
  before_filter :confirm_logged_in
  
  def entry
    if cookies[:user_id]
     user_id = cookies.signed[:user_id]
    else
      user_id = session[:user_id]
    end
    @habits = Habit.order("name ASC").find_all_by_user_id([0, user_id])
    @user = User.find(user_id)
  end
  
  def new
    @habit = Habit.new
  end
  
  def create
    @habit = Habit.new(params[:habit])
    if @habit.save
      redirect_to root_url, notice: "#{@habit.name} has been added!"
    else
      flash[:notice] = '#{@habit.name} not created.'
      render("create")
    end
  end
  
  def add
    @habit = Habit.find(params[:add][:habit])
    user_id = Digest::SHA256.hexdigest(cookies[:user_id])
    @habit.users << User.find(session[:user_id])
    flash[:notice] = "#{@habit.name} recorded!"
    redirect_to(:action => 'entry')
  end
  
  def delete
    @habit = Habit.find(params[:id])
  end

  def destroy
    Habit.find(params[:id]).destroy
    flash[:notice] = "Habit removed."
    redirect_to(:action => 'list')
  end
  
end
