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
