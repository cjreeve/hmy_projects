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