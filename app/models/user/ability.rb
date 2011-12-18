class User::Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :create, :player if user.is?(:user) && !user.is?(:player)
    can :view, :player
  end
end
