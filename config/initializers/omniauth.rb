Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, (ENV['TWITTER_KEY'] || 'QUXLcMLS1vjQJJEuK4C5A'), (ENV['TWITTER_SECRET'] || 'iTIUHbLC1Y4aUZVoe9HBUCicO9fC1kPDGu7PaTicA')
end
