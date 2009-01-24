# Include hook code here
require File.join(File.dirname(__FILE__), "lib", "login_logger")
ActiveRecord::Base.send(:include, Brainnovate::Is::Loggable)
ActionController::Base.send(:include, Brainnovate::LoginLogger)