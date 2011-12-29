When /^I create a new post titled "([^"]*)" with attachment "([^"]*)"$/ do |arg1, arg2|
  fill_in "post[title]", :with => arg1
  fill_in "post[body]", :with => arg1
  attach_file "attachments[][attachment]", "features/support/fixtures/#{arg2}"
  click_on "create"
  
end

Then /^I should see a new post saying "([^"]*)" with photo "([^"]*)"$/ do |arg1, arg2|

  page.should have_css(selector_for("post"), :text => arg1)
  page.should have_xpath(xpath_for("image #{arg2}"))
end
