class HabitsUser < ActiveRecord::Base
  #attr_accessible :email, :password, :password_confirmation, :last_name, :first_name
  
  belongs_to :habit
  belongs_to :user
end
