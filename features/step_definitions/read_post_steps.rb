require 'watir-webdriver'
require 'page-object'

include PageObject::PageFactory


When /^I am on the homepage$/ do
  visit_page(HomePage) do |page|
  end
end

Then /^I can click on a post to get to the post page$/ do
  on_page(HomePage) do |page|
    title = page.post_title_list_elements[0].text
    url = "https://www.csciblogs.com/title.html" + title + ".html"
    page.post_link_elements[0].click
    expect(@browser.url).to eq(url)
  end
end


When /^I am on the post page$/ do
  visit_page(HomePage) do |page|
    page.post_link_elements[0].click
  end
end

Then /^I can see the title, author, and body of the post$/ do
  on_page(ReadPost) do |page|
    expect(page.title_author_test).to eq(true)
  end
end
Then /^I can access the homepage$/ do
  on_page(ReadPost) do |page|
    page.home_link
    expect(@browser.url).to eq("https://www.csciblog.com")
  end
end