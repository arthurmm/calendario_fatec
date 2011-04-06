class Ability
  Rails::logger.info("Ability loaded")
  include CanCan::Ability
 
  def initialize(user)
    @user ||= user

    @user.roles.each do |role|
      Rails.logger.info role.inspect
      role.rules.each do |rule|
        Rails.logger.info rule.permissoes.inspect
        can rule.permissoes, Kernel.const_get(rule.model_controller)
      end
    end
  end

end

