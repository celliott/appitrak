class HabitsController < ApplicationController
  
  before_filter :confirm_logged_in
  
  def entry
    show_menu 
    habit_ids = UsersHabit.where("user_id=?", current_user_id).collect {|i| i.habit_id}
    @habits = Habit.order("name ASC").where(:id => habit_ids)
    @user = User.find(current_user_id)
  end
  
  def daily_chart
    @has_range = false
    @has_date = true
    @current_user_id = current_user_id
    if params[:daily_chart]
    	@date_select = params[:daily_chart][:date_select].split(/\s*,\s*/)	
      if @date_select[1]
        @has_range = true
      elsif @date_select[0].nil?
        @has_date = false
      end
    end
    if !@has_range
      @single_date = Time.now.to_date
      if params[:daily_chart]
        @date_select = params[:daily_chart][:date_select]
        if @date_select != ""
          @single_date = DateTime.strptime(@date_select, "%m/%d/%Y")
        else
          @single_date = Time.now.to_date
        end 
      end
      daily_habits = HabitsUser.where("user_id=? AND DATE(created_at) = DATE(?)", current_user_id, @single_date).collect {|i| i.habit_id}
      @habits = Habit.order("name ASC").where(:id => daily_habits)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
  
  def totals
    show_menu  
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
