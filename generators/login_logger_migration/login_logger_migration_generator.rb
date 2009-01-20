class LoginLoggerMigrationGenerator < Rails::Generator::Base
  def manifest
    record do |m|
      m.migration_template 'migration.rb', 'db/migrate' 
    end
  end
  
  def file_name
    "login_logger_migration"
  end  
  
end
