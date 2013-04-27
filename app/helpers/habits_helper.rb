module HabitsHelper
  def habits_chart_data    
  puts Time.now.in_time_zone(cookies[:time_zone]).to_datetime.utc
  puts 'ssss'
    if Time.now.in_time_zone(cookies[:time_zone]).to_datetime.strftime("%H") < "04"
      today = Time.now.in_time_zone(cookies[:time_zone]).to_datetime
    else
      today = Time.now.in_time_zone(cookies[:time_zone]).to_datetime.utc
    end
    
      today = Time.now.in_time_zone(cookies[:time_zone]).to_datetime    
    if cookies[:trend] == '1'
      @start_date = Time.now.in_time_zone(cookies[:time_zone]).beginning_of_week.to_datetime
      @end_date = today
    elsif cookies[:trend] == '2'
      @start_date = 1.week.ago.beginning_of_week.to_datetime
      @end_date = 1.week.ago.end_of_week.to_date
    elsif cookies[:trend] == '3'
      @start_date = 2.weeks.ago.beginning_of_week.to_datetime
      @end_date = today
    elsif cookies[:trend] == '4'
      @start_date = 4.weeks.ago.beginning_of_day.to_datetime
      @end_date = today
    elsif cookies[:trend] == '5'
      @start_date = 3.months.ago.beginning_of_day.to_datetime
      @end_date = today
    elsif cookies[:trend] == '6'
      @start_date = 6.months.ago.beginning_of_day.to_datetime
      @end_date = today
    end     
  end
end
