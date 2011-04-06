class AddUsernameToUsers < ActiveRecord::Migration
  def self.up
    User.create(:email => "admin@admin.com.br", :password => "admin", :password_confirmation => "admin")
  end

  def self.down
  end
end

