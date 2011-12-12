Then /^I should see "([^"]*)"$/ do |arg1|
  page.should have_content(arg1)
end
When /^I visit (.*)$/ do |path|
  visit(path_for(path))
end

