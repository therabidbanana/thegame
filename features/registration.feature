Feature: Registration
  In order to use the site
  As a new user
  I should be able to register

  Background:

  Scenario: Log in with twitter
    Given I am logged in on twitter
    When I visit the registration page
    And I sign in with twitter
    Then I should see "Welcome new user"

    When I complete registration with username "Foobar Bazington"
    Then I should be on Foobar Bazington's player page


  
