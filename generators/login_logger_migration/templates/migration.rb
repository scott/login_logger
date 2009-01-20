class LoginLoggerMigration < ActiveRecord::Migration
  def self.up
    create_table :login_logs do |t|
      t.integer :user_id
      t.string :login
      t.string :ip_address
      t.datetime :created_at
      t.boolean :failed, :default => true
    end
    
    add_index :login_logs, :user_id

  end
  
  def self.down
    drop_table :login_logs
  end
end