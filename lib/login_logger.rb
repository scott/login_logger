# LoginLogger
module Brainnovate
  module LoginLogger
    
    def log_login
      unless current_user.blank?
        LoginLog.create(:user_id => current_user.id,
                        :login => current_user.login,
                        :ip_address => request.remote_ip,
                        :failed => false
                        )
      else
        LoginLog.create(:login => params[:login],
                        :ip_address => request.remote_ip)    
      end
    end
  end

  module Is #:nodoc:
    module Loggable #:nodoc:

      def self.included(base)
        base.extend ClassMethods
      end

      module ClassMethods
        def is_loggable
          
          has_many :login_logs, :order => 'created_at ASC'
          
          include Brainnovate::Is::Loggable::InstanceMethods
          extend Brainnovate::Is::Loggable::SingletonMethods
        end
      end

      module SingletonMethods
        # Add class methods here
      end

      module InstanceMethods
        # Add instance methods here
      end
    end
  end
end