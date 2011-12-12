Given /^I am logged in on twitter$/ do
  OmniAuth.config.add_mock(:twitter, {:uid => '12345', :info => {:username => "bob"}})
end
