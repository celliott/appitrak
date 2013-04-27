class HabitsUser < ActiveRecord::Base
  attr_accessible :name, :user_id, :created_at
  
  belongs_to :habit
  belongs_to :user
end
