class AddGroupInUser < ActiveRecord::Migration
  def self.up
    u = User.first
    u.group_id = Group.first.id
    u.update_attributes(:group => Group.first, :password=> '123456', :password_confirmation => '123456')
    u.save
  end

  def self.down
  end
end
