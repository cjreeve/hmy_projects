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
    Then I should see a comment field where a user can enter their name and comment
    And I add the name "Collaborator" and the comment "Nice project" and click the Post Comment button
    And I see my comment listed on the project page along with my name