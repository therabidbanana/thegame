class User
  include MongoMapper::Document

  key :provider, String
  key :uid, String
  key :name, String
  key :email, String
  one :player

  # Include roles and initializing cancan
  include User::Authorizable

  attr_accessible :provider, :uid, :name, :email

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
         user.name = auth['info']['name'] || ""
         user.email = auth['info']['email'] || ""
      end
    end
  end

  def register_player!(params)
    self.player = Player.new(params)
    self.roles << :player
    self.save
    self.player.save
    self.player
  end
end

