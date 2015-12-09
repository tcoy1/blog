Feature: As a reader
  I want to comment on a post
  So that I can let the world know I disagree with the author

  Scenario: I should be able to leave multiple comments on a post and 
    see all previous comments
    When I am looking at a post
    Then I can leave multiple comments
    Then I can see the previous comments ordered by date
    Then I can see the names of the comments authors