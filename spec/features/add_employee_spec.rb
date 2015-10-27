require 'rails_helper'

feature 'Add an employee', %{
  As a standup scheduler
  I want to add an employee
  So that they can be assigned to standups

  Acceptance Criteria:
  []  I must provide an employee name
  []  On success, I am brought to the employees page with a success message
  []  If no name is provided, the form is re-loaded with an error message
} do

  scenario 'provide valid employee name' do
    visit employees_path
    click_link 'Add a New Employee'

    fill_in 'Name', with: 'John Smith'

    click_button 'Create Employee'

    expect(page).to have_content('Employee Successfully Added')
    expect(page).to have_content('John Smith')
  end

  scenario 'Employee name is not entered' do
    visit employees_path
    click_link 'Add a New Employee'

    click_button 'Create Employee'
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Enter employee name below")
  end
end
