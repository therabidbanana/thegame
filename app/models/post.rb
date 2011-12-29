class Post
  include MongoMapper::Document
  plugin MongoMapper::Plugins::Sluggable
  belongs_to :player
  many :attachments, :as => :attachable

  key :title, String
  sluggable :title, :index => false

  key :body, String
  key :tags, Array, :default => []

  timestamps!

  def self.find(user_or_id)
    post = self.find_by_slug(user_or_id)
    post ? post : super(user_or_id)
  end
  def photo?
    !photos.empty?
  end
  def photo_url
    return "" unless photo?
    photos.first.large_url
  end
  def photos
    attachments.select{|a| a.image? }
  end
  def to_param
    slug
  end
end
