class UsersHabit < ActiveRecord::Base
  
  belongs_to :habit
  belongs_to :user

end
