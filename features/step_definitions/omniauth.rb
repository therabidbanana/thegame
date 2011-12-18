Given /^I am logged in on twitter$/ do
  OmniAuth.config.add_mock(:twitter, {:uid => '12345', :info => {:username => "bob"}})
end

Given /^I am logged in as player (.+)$/ do |arg1|
  user = Factory(:user)
  OmniAuth.config.add_mock(user.provider, {:uid => user.uid, :info => {:username => "bob"}})
  p = user.register_player!(:username => arg1, :user => user)
  visit '/auth/twitter'
end
