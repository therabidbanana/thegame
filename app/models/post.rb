class Post
  include MongoMapper::Document
  plugin MongoMapper::Plugins::Sluggable
  key :title, String
  sluggable :title, :index => false

  key :body, String
  key :tags, Array, :default => []
end
