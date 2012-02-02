Feature: Using the interface
  In order to view custom data
  As a user
  I want to use an interface for viewing and filtering data

  Scenario: Selecting a model to show data for
    Given dredge has some models
    Then I should be able to select a model from a list
