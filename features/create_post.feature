Feature: As an author
  I want to create a post
  So that I can share my knowledge with the world
  
  Scenario: I can not duplicate post titles
    When I create a new post
    Then I can not create a duplicate title
    
  Scenario: I can access the homepage from the new post page
    When I am on the new post page
    Then I can access the home page