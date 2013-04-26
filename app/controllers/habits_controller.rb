require 'date_extensions'
class HabitsController < ApplicationController
  
  before_filter :confirm_logged_in
  
  def entry
    show_menu 
    habit_ids = UsersHabit.where("user_id=?", current_user_id).collect {|i| i.habit_id}
    @habits = Habit.order("name ASC").where(:id => habit_ids)
    @user = User.find(current_user_id)
    if @habits.empty?
      redirect_to(:controller => 'habit_types')
      flash[:alert] = 'add or select some habits to get started'
    end
  end
  
  def daily_chart
    @current_user_id = current_user_id
    daily_habits = HabitsUser.where("user_id=?", @current_user_id).collect {|i| i.habit_id}
    @habits = Habit.order("name ASC").where(:id => daily_habits)
    cookies[:trend] = { :value => '1' } if !cookies[:trend]
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def trends
    show_menu  
    habit_check = HabitsUser.where("user_id=?", current_user_id).count
    if habit_check < 1
      redirect_to(:controller => 'habits')
      flash[:alert] = 'you need to track a habit before viewing trends'
    end
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
      render("habit_types")
    end
  end
  
  def add
    @habit = Habit.find(params[:add][:habit])
    @habit.users << User.find(current_user_id)
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
