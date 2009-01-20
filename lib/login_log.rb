class LoginLog < ActiveRecord::Base
  belongs_to :user
  
  named_scope :by_date, lambda { |*args| 
     {
     :conditions => ["created_at BETWEEN ? AND ?", (args[0]||Time.now).beginning_of_day.to_s(:db), (args[1]||Time.now).end_of_day.to_s(:db)] 
     } } 
     
     
  named_scope :last_ten_minutes, lambda { |*args| 
     {
     :conditions => ["created_at BETWEEN ? AND ?", 10.minutes.ago.to_s(:db), Time.now.to_s(:db)] 
     } } 
 
  named_scope :failed, :conditions => ['failed = ?', true]
  
end