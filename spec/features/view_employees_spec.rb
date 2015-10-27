require 'rails_helper'

feature 'View employees', %{
  As a standup scheduler
  I want to view a list of employee
  So I can see who can be assigned to standups

  Acceptance Criteria:
  [x]  I must see a list of all employees
  [x]  I must see whether the employee is active or inactive
} do

  let!(:employee1) { FactoryGirl.create(:employee) }
  let!(:employee2) { FactoryGirl.create(:employee, active: false) }

  scenario 'views list of employees' do
    visit employees_path
    expect(page).to have_content("#{employee1.name}: (Active)")
    expect(page).to have_content("#{employee2.name}: (Inactive)")
  end
end
