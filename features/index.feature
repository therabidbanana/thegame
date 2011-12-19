Feature:
  As a user
  I want to be able to see all posts

  Scenario: List posts
    Given there are 3 posts
    When I visit the home page
    Then I should see 3 posts
