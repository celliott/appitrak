class HabitsUser < ActiveRecord::Base
  attr_accessible :habit_id, :user_id, :habit_time
  
  belongs_to :habit
  belongs_to :user
  
end
