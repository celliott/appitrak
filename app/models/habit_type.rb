class HabitType < ActiveRecord::Base
  # attr_accessible :title, :body
  
  has_many :users_habit
  has_many :users, :through => :users_habit
  
end
