require 'watir-webdriver'
require 'page-object'

include PageObject::PageFactory


When /^I am looking at a post$/ do
  visit_page(HomePage) do |page|
    page.post_link_elements[0]#.click
  end
end

Then /^I can leave multiple comments$/ do
  on_page(ReadPost) do |page|
    page.write_comment
    page.write_comment
    expect(page.write_comment).to eq(true)
  end
end
Then /^I can see the previous comments ordered by date$/ do
  on_page(ReadPost) do |page|
    expect(page.date_order_test).to eq(true)
  end
end
Then /^I can see the names of the comments authors$/ do
  on_page(ReadPost) do |page|
    expect(page.comment_author_list_elements[0].text).to not_eq("")
  end
end