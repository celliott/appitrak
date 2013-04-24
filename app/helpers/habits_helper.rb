module HabitsHelper

  def habits_chart_data    
    if @has_range
      @chart_data_range = Array.new
      @range_data = Array.new
      @range_data_display = Array.new
      @range_data_display2 = Array.new
      daily_habit_count = Array.new
      
      start_date = Date.strptime(@date_select[0], "%m/%d/%Y")
      end_date = Date.strptime(@date_select[1], "%m/%d/%Y")
    	#(start_date..end_date).each do |date|
    	start_date.upto(end_date) do |date|
    	  daily_habits = HabitsUser.where("user_id=? AND DATE(created_at) = DATE(?)", @current_user_id, date).collect {|i| i.habit_id}
        habits = Habit.order("name ASC").where(:id => daily_habits)
        	habits.each do |habit|
	 			    daily_count = HabitsUser.where("user_id=? AND habit_id = ? AND DATE(created_at) = DATE(?)", @current_user_id, habit.id, date).count
				    daily_habit_count << 'h' + habit.id.to_s + ': "' + daily_count.to_s + '"'
				    @daily_habit_c = daily_habit_count.map(&:inspect).join(', ')				    
				  end
				  @daily_habit_counter = '{d: "' + date.to_s + '", ' + @daily_habit_c.to_s + '}'
          @daily_habit_counterer = @daily_habit_counter.to_s.gsub('\"', '"').gsub('\""', '"').gsub('""', '"').gsub('"h', 'h').gsub('"', "'")
				  
				  @range_data_display << @daily_habit_counterer
				  @range_data_display

      end 
      @range_data_display.each do |range_data_display|
				    puts 'djhdjhdjhdjhdjhdjhdjhdjhdjhdjhdjhdjh' 
				    puts range_data_display
				  end 
      @range_data_display
    else
      if !@habits.blank?
	      @habits.map do |habit|
	 			daily_count = HabitsUser.where("user_id=? AND habit_id = ? AND DATE(created_at) = DATE(?)", @current_user_id, habit.id, @single_date).count
		        { 
		          h: habit.name, 
		          c: daily_count 
		        }
	      end  
	    else 
	       @no_data = true
	    end  
    end
  end

end
