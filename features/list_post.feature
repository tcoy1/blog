Feature: As a reader
  I want to read posts from my favorite blogger
  So that I can learn something
  
  Scenario: Published posts should be available to readers.
    When a post is published
    Then it should be immediately available
    
  Scenario: Published posts should include the title and author and be in order.
    When I look at a list of published posts
    Then the posts should include the title and author
    Then the posts should be ordered by the date with the most recent at the top.