Feature: Make Posts
  As a user
  I should be able to create posts
  To meet my goals

  Scenario: Create a Post
    Given I am logged in as player foobar
    When I visit the new post page
    And I create a new post titled "Foobar Baz" with text "Test"
    Then I should see a new post saying "Foobar Baz"
