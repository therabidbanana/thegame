class Post
  include MongoMapper::Document
  plugin MongoMapper::Plugins::Sluggable
  belongs_to :player

  key :title, String
  sluggable :title, :index => false

  key :body, String
  key :tags, Array, :default => []

  timestamps!

  def self.find(user_or_id)
    post = self.find_by_slug(user_or_id)
    post ? post : super(user_or_id)
  end
  def to_param
    slug
  end
end
