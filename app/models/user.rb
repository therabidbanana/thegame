class User
  include MongoMapper::Document

  one :player

  # Include roles and initializing cancan
  include User::Authorizable

  # Include roles and initializing cancan
  include User::Identifiable
  # attr_accessible :provider, :uid, :name, :email


  def register_player!(params)
    self.player = Player.new(params)
    self.roles << :player
    self.save
    self.player.save
    self.player
  end
end

