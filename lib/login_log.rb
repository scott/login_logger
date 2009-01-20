class LoginLog < ActiveRecord::Base
  belongs_to :user
  
  
  
  #User last logged in
  def self.previous
    LoginLog.find(:last, :order => 'created_at ASC')
  end
  
  #User first logged in
  def self.first
    LoginLog.find(:first, :order => 'created_at ASC')
  end
  
end