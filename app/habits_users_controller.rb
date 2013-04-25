class HabitsUsersController < ApplicationController
  
  before_filter :confirm_logged_in
   
  def new
    @user = HabitsUsers.new
  end

  def create
    @habit_user = HabitsUsers.new(params[:habit_user])
    @habit = User.find(@habit_user.habit)
    @user = User.find(session[:user_id])
    if @habit_user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "#{@habit.name} Saved!"
    else
      render("create")
    end
  end

  def delete
    @habit_user = HabitsUsers.find(params[:id])
  end

  def destroy
    HabitsUsers.find(params[:id]).destroy
    redirect_to root_url, notice: "#{@habit.name} removed!"
  end
  
end