require 'digest/sha1'

class Habit < ActiveRecord::Base
  attr_accessible :name, :user_id
  
  has_many :habits_user
  has_many :users, :through => :habits_user

  def hashed(value)
    self.value = Digest::SHA256.hexdigest(value)
  end

end
