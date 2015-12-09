require 'watir-webdriver'
require 'page-object'

include PageObject::PageFactory


When /^I create a new post$/ do
  visit_page(HomePage) do |page|
    page.new_post_button
    page.write_new_post
  end
end

Then /^I can not create a duplicate title$/ do
  on_page(CreatePost) do |page|
    expect(page.duplicate_title_test).to eq(true)
  end
end


When /^I am on the new post page$/ do
  visit_page(HomePage) do |page|
    page.new_post_button
  end
end

Then /^I can access the home page$/ do
  on_page(CreatePost) do |page|
    page.home_link
    expect(@browser.url).to eq("https://www.csciblog.com")
  end
end