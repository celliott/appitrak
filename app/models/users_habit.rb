class UsersHabit < ActiveRecord::Base
  #attr_accessible :email, :password
  
  belongs_to :habit
  belongs_to :user
end
