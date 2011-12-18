Factory.define(:user) do |user|
  user.sequence(:uid){ |n| "#{n}" }
  user.provider "twitter"
end

Factory.define(:user_player, :parent => :user) do |user|
  user.association :player, :factory => :player
end

Factory.define(:player) do |player|
  player.sequence(:username){|n| "banana#{n}"}
end

