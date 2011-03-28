class Ability
  Rails::logger.info("Ability loaded")
  include CanCan::Ability
 
  def initialize(user)
    @user ||= user

    @user.roles.each do |role|
      Rails.logger.info role.inspect
      role.rules.each do |rule|
        Rails.logger.info rule.inspect
        can :read, rule.model_controller if rule.action & 0x01 > 0
        can :create, rule.model_controller if rule.action & 0x02 > 0
        can :update, rule.model_controller if rule.action & 0x04 > 0
        can :destroy, rule.model_controller if rule.action & 0x08 > 0
        can :index, rule.model_controller if rule.action & 0x01 > 0
      end
    end
  end

end

