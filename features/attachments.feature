Feature: Make Posts with attachments
  As a user
  I should be able to create posts
  To meet my goals

  Scenario: Create a Post with an attachment
    Given I am logged in as player foobar
    When I visit the new post page
    And I create a new post titled "Foobar Baz" with attachment "banana.jpeg"
    Then show me the page
    Then I should see a new post saying "Foobar Baz" with photo "banana.jpeg"

