# Tag scenarios as @wip to skip them until implemented. Run Cucumber with --tags 'not @wip' to only run ready scenarios.

Feature: Project listing
  As a user
  I want to visit the home page
  So that I can see a list of projects

  @javascript
  Scenario: Visiting the home page
    Given there are no projects in the system
    When I visit the home page
    Then I should see an empty list of projects with "No projects found"
    When I click on the New Project button
    Then I should see I should see a New Project title
    When I fill in the new project form fields and click on Create Project
    Then I should see the project title and description
    And I should see the project state is draft
    Then I should click on the Proceed button
    And I should see that the project state is proceeding
    Then I should see a comment field where a user can enter their name and comment
    And I add the name "Collaborator" and the comment "Nice project" and click the Post Comment button
    And I see my comment listed on the project page along with my name
    When I click on the Back link
    Then I see a list with the new project I created
    When I click Show on the project I created
    Then I should see a "Complete project" button
    When I click on the "Complete project" button
    Then I see the state is done and a button to "Restart" the state to "proceeding"
    Then I should see a list of recent state changes "proceeding" and "done"
    When I click on the Back link
    Then I click on the Destroy link and confirm
    Then I am shown the empty project list page with "No projects found"
