class Player
  include MongoMapper::Document
  plugin MongoMapper::Plugins::Sluggable
  belongs_to :user
  key :username, String
  sluggable :username
end
