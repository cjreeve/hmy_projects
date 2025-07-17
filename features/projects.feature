# Tag scenarios as @wip to skip them until implemented. Run Cucumber with --tags 'not @wip' to only run ready scenarios.

Feature: Project listing
  As a user
  I want to visit the home page
  So that I can see a list of projects

  Scenario: Visiting the home page
    Given there are no projects in the system
    When I visit the home page
    Then I should see an empty list of projects with "No projects found"
    When I click on the New Project button
    Then I should see I should see a New Project title
    When I fill in the new project form fields and click on Create Project
    Then I should see the project title and description
    Then I should see a comment field where a user can enter their name and comment
    And I add the name "Collaborator" and the comment "Nice project" and click the Post Comment button
    And I see my comment listed on the project page along with my name
    When I click on the Back link
    Then I see a list with the new project I created
