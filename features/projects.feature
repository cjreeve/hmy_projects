# Tag scenarios as @wip to skip them until implemented. Run Cucumber with --tags 'not @wip' to only run ready scenarios.

Feature: Project listing
  As a user
  I want to visit the home page
  So that I can see a list of projects

  Scenario: Visiting the home page
    Given there are projects in the system
    When I visit the home page
    Then I should see a list of projects
    When I click on a project I should see the project description