# LoginLogger


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