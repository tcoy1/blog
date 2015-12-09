require 'watir-webdriver'
require 'page-object'

include PageObject::PageFactory


When /^a post is published$/ do
  visit_page(HomePage) do |page|
    page.new_post_button
  end
  on_page(CreatePost) do |page|
    page.post_title = "test"
    page.post_author = "test"
    page.post_body = "test"
    page.create_post
    page.home_link
  end
end

Then /^it should be immediately available$/ do
  on_page(HomePage) do |page|
    expect(page.find_test_post).to eq(true)
  end
end


When /^I look at a list of published posts$/ do
  visit_page(HomePage) do |page|
  end
end

Then /^the posts should include the title and author$/ do
  on_page(HomePage) do |page|
    expect(page.post_title_list_elements.length).to be > 0
    expect(page.post_author_list_elements.length).to be > 0
  end
end
Then /^the posts should be ordered by the date with the most recent at the top.$/ do
  on_page(HomePage) do |page|
    expect(page.date_order_test).to eq(true)
  end
end