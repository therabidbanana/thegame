class User::Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :create, :player if user.is?(:user) && !user.is?(:player)
    can :view,   :player
    can :view,   :post
    can :create, :post if user.is?(:player)
  end
end
