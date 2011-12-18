class Player
  include MongoMapper::Document
  def self.find(user_or_id)
    user = self.find_by_slug(user_or_id)
    user ? user : super(user_or_id)
  end

  plugin MongoMapper::Plugins::Sluggable
  belongs_to :user
  key :username, String
  sluggable :username, :index => false
  def to_param
    slug
  end
end
