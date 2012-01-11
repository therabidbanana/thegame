module MongoSetup
  MongoMapper.config = YAML.load(ERB.new(File.read("#{Rails.root}/config/mongo.yml")).result)
  begin
    MongoMapper.connect(Rails.env)
    User.ensure_index([['authentications.provider', 1], ['authentications.uid', 1]])
  rescue
    puts "Problem connecting to MongoDB. Skipping ensure_index calls..."
  end
end
