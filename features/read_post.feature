Feature: As a reader
  I want to read an entire post
  So that I can get all the details

  Scenario: I should be able to click on a post from the homepage
    to get to the post.
    When I am on the homepage
    Then I can click on a post to get to the post page
    
  Scenario: The post page should show the entire post, the title, and the author
    with access to the homepage.
    When I am on the post page
    Then I can see the title, author, and body of the post
    Then I can access the homepage