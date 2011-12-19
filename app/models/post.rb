class Post
  include MongoMapper::Document
  plugin MongoMapper::Plugins::Sluggable
  belongs_to :player

  key :title, String
  sluggable :title, :index => false

  key :body, String
  key :tags, Array, :default => []
end
