Feature: Make Posts
  As a user
  I should be able to create posts
  To meet my goals

  Scenario: Create a Post
    Given I am logged in as player foobar
    When I visit the new post page
    And I create a new post titled "Foobar Baz" with text "Test"
    Then I should see a new post saying "Foobar Baz"

  Scenario: List player's posts
    Given I am logged in as player foobar
    Given there are 3 posts
    When I visit the new post page
    And I create a new post titled "Foobar Baz" with text "Test"
    And I visit foobar's player page
    Then I should see a new post saying "Foobar Baz"
    And I should see 1 post

