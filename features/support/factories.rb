Factory.define(:user) do |user|
  user.identities{ |i| [i.association(:identity)]}
end

Factory.define(:identity, :class => User::Identity) do |i|
  i.sequence(:uid){ |n| "#{n}" }
  i.provider "twitter"
end

Factory.define(:user_player, :parent => :user) do |user|
  user.association :player, :factory => :player
end

Factory.define(:player) do |player|
  player.sequence(:username){|n| "banana#{n}"}
end

