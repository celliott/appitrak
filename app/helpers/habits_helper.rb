module HabitsHelper

  def habits_chart_data    
    if cookies[:trend] && cookies[:trend] != '0'
      if cookies[:trend] == '1'
        @start_date = Time.now.beginning_of_week.to_date
        @end_date = Time.now.to_date
        @totals_for = 'current week'
      elsif cookies[:trend] == '2'
        @start_date = 1.week.ago.to_date
        @end_date = Time.now.to_date
        @totals_for = 'last week'
      elsif cookies[:trend] == '3'
        @start_date = 2.weeks.ago.to_date
        @end_date = Time.now.to_date
        @totals_for = 'last 2 weeks'
      elsif cookies[:trend] == '4'
        @start_date = 4.weeks.ago.to_date
        @end_date = Time.now.to_date
        @totals_for = 'last month'
      elsif cookies[:trend] == '5'
        @start_date = 3.months.ago.to_date
        @end_date = Time.now.to_date
        @totals_for = 'last 3 months'
      elsif cookies[:trend] == '6'
        @start_date = 6.months.ago.to_date
        @end_date = Time.now.to_date
        @totals_for = 'last 6 months'
      end      
    # elsif cookies[:trend] == '0'
#       @habits.map do |habit|
#  			  daily_count = HabitsUser.where("user_id=? AND habit_id = ? AND DATE(created_at) = DATE(?)", @current_user_id, habit.id, @single_date).count
# 	        { 
# 	          h: habit.name, 
# 	          c: daily_count 
# 	        }
#       end   
    end
  end

end
