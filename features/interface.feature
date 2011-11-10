Feature: Using the interface
  In order to view custom data
  As a user
  I want to use an interface for viewing and filtering data

  Background:
    Given a User model

  Scenario: selecting a model to show records for
    Given I am on the dredge interface page
     Then I should be able to choose to show results for the User model

  Scenario: selecting what fields to show
    Given I am on the dredge interface page
     Then I should not be able to select some User fields

     When I choose to show results for the User model
     Then I should be able to select some User fields

     When I select some User fields
     Then I should see the selected fields in the results table

  Scenario: viewing the results when there is no data
    Given I am on the dredge interface page
      And I have chosen to show results for the User model
      And there are no User records in the system
      And I select some User fields
     Then I should be told there are no results

  Scenario: viewing the results when there is some data
    Given I am on the dredge interface page
      And I have chosen to show results for the User model
      And there are some User records in the system
      And I select some User fields
     Then I should see some User data in the results table
