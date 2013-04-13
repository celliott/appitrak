class Habit < ActiveRecord::Base
  attr_accessible :name, :user_id
  
  has_many :habits_user
  has_many :users, :through => :habits_user

end
