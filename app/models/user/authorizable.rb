module User::Authorizable
  def self.included(base)
    base.class_eval do
      # Set up roles
      include RoleModel
      key :roles_mask, Integer
      # Always append roles to the end, or the bitmask goes wonky.
      roles :admin, :user, :player
      delegate :can?, :cannot?, to: :ability

      after_validation :default_role, :on => :create
    end
  end

  def default_role
    roles << :user
  end

  # Get Ability
  def ability
    @ability ||= User::Ability.new(self)
  end

end
