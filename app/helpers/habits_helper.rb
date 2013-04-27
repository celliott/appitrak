require 'date_extensions'

module HabitsHelper
  def habits_chart_data    
    if cookies[:trend] == '1'
      @start_date = Time.now.in_time_zone(cookies[:time_zone]).beginning_of_week.to_date
      @end_date = Time.now.in_time_zone(cookies[:time_zone]).to_date
    elsif cookies[:trend] == '2'
      @start_date = 1.week.ago.beginning_of_week.to_date
      @end_date = 1.week.ago.end_of_week.to_date
    elsif cookies[:trend] == '3'
      @start_date = 2.weeks.ago.beginning_of_week.to_date
      @end_date = Date.today_in_zone(cookies[:time_zone])
    elsif cookies[:trend] == '4'
      @start_date = 4.weeks.ago.beginning_of_day.to_date
      @end_date = Date.today_in_zone(cookies[:time_zone])
    elsif cookies[:trend] == '5'
      @start_date = 3.months.ago.beginning_of_day.to_date
      @end_date = Date.today_in_zone(cookies[:time_zone])
    elsif cookies[:trend] == '6'
      @start_date = 6.months.ago.beginning_of_day.to_date
      @end_date = Date.today_in_zone(cookies[:time_zone])
    end     
  end
end
