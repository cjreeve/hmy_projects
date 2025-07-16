Given('there are projects in the system') do
  Project.create!(title: 'Project Alpha', description: 'First project', manager_name: 'Alice', state: 'draft')
  Project.create!(title: 'Project Beta', description: 'Second project', manager_name: 'Bob', state: 'draft')
end

When('I visit the home page') do
  visit root_path
end

Then('I should see a list of projects') do
  expect(page).to have_content('Project Alpha')
  expect(page).to have_content('Project Beta')
end

When('I click on a project I should see the project description') do
  # Find the project card for Project Alpha and click its 'Show' link
  within(:xpath, "//div[contains(., 'Project Alpha')]") do
    click_link('Show')
  end
  expect(page).to have_content('First project')
end

Then('I should see a comment field where a user can enter their name and comment') do
  expect(page).to have_selector('form')
  expect(page).to have_field('Name')
  expect(page).to have_field('Comment')
end

Then(/^I add the name "([^"]*)" and the comment "([^"]*)" and click the Post Comment button$/) do |name, comment|
  fill_in 'Name', with: name
  fill_in 'Comment', with: comment
  click_button 'Post Comment'
end

Then('I see my comment listed on the project page along with my name') do
  expect(page).to have_content('Collaborator')
  expect(page).to have_content('Nice project')
end 