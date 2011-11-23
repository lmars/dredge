Feature: Adding some filters
  In order to view filtered data
  As a user
  I want to be able to apply some filters

  Background:
    Given a User model
      And I have chosen to show results for the User model

  Scenario: adding an equality filter on a model column
    Given I am on the dredge filter page
     Then I should be able to select some User column filters

     When I select a User column filter
     Then I should be asked how I want to filter the selected column

     When I choose to filter by equality on the selected column
     Then I should see some filtered results
