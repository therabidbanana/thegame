require 'dragonfly/rails/images'

app = Dragonfly[:images]
app.configure do |c|
  c.datastore = Dragonfly::DataStorage::S3DataStore.new
  c.datastore.configure do |d|
    d.bucket_name = "thegame.#{Rails.env}"
    d.access_key_id = ENV['S3_KEY']
    d.secret_access_key = ENV['S3_SECRET']
  end

  c.url_format = "/media/:job/:sha/:basename.:format"

  c.job :small do 
    process :thumb, '98x98#'
  end
  c.job :medium do 
    process :thumb, '398x338#'
  end
  c.job :large do 
    process :thumb, '700x500#'
  end
end
app.define_macro_on_include(MongoMapper::Document, :image_accessor)
app.define_macro_on_include(MongoMapper::EmbeddedDocument, :image_accessor)

