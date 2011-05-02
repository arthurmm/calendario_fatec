class AddDefaultUser < ActiveRecord::Migration
  def self.up
	User.create(:name => "admin", :email => "admin@admin.com.br", :password => "123456", :password_confirmation=> "123456")
  end

  def self.down
	User.find(:first, :conditions => {:nome => "admin", :email => "admin@admin.com.br"}).delete
  end
end
