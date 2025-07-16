# Example Project Management Tool

## Task

Use Ruby on Rails to build a project conversation history. A user should be able to:
- leave a comment
- change the status of the project

The project conversation history should list comments and changes in status. 

## Cucumber BDD Workflow

- Scenarios/features that are not yet implemented are tagged with `@wip` in their `.feature` files.
- To run only ready/implemented scenarios, use:

    bin/cucumber --tags 'not @wip'

- This keeps the test suite green while you incrementally build out features.
- As you implement each scenario, remove the `@wip` tag so it runs as part of the main suite. 
