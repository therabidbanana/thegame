class Player
  include MongoMapper::Document
  belongs_to :user
end
