When /^I create a new post titled "([^"]*)" with text "([^"]*)"$/ do |arg1, arg2|
  fill_in "post[title]", :with => arg1
  fill_in "post[body]", :with => arg2
  click_on "create"
end

Then /^I should see a new post saying "([^"]*)"$/ do |arg1|
  page.should have_css(selector_for("post"), :text => arg1)
end

Given /^there are (\d+) posts$/ do |arg1|
  user = Factory(:user_player)
  (0...Integer(arg1)).each do |i|
    Post.create!(:player => user.player, :title => "foobar", :body => "baz")
  end
end

Then /^I should see (\d+) posts?$/ do |arg1|
  page.should have_css(selector_for("post"), :count => Integer(arg1))
end
