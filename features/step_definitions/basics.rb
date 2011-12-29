Then /^I should see "([^"]*)"$/ do |arg1|
  page.should have_content(arg1)
end
When /^I visit (.*)$/ do |path|
  visit(path_for(path))
end
Then /^I should be on (.+)$/ do |path|
  current_path.should == path_for(path)
end

Then /^show me the page/ do
  save_and_open_page
end
