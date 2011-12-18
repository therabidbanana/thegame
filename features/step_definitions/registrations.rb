When /^I sign in with twitter$/ do
  click_on link_text_for("sign in with twitter")
end

When /^I complete registration with username "([^"]*)"$/ do |arg1|
  fill_in "player[username]", :with => arg1
  click_on "create"
end


