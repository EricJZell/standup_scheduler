require 'rails_helper'

feature 'Create a standup', %{
  As a standup scheduler
  I want to create a new standup
  So that there are standups scheduled for the coming days

  Acceptance Criteria:
  [x]  Only active employees should be selected for the standup
  [x]  If there are not enough active employees, I receive an error message and
       am brough to the employees path
} do

  scenario 'Only active employees are selected for standups' do
    employee1 = FactoryGirl.create(:employee, active: false)
    employee2 = FactoryGirl.create(:employee)
    employee3 = FactoryGirl.create(:employee)
    visit standups_path
    click_link 'Add a standup'
    click_button 'Create Standup'
    expect(page).to have_content(employee2.name)
    expect(page).to have_content(employee3.name)
    expect(page).to have_content("Standup Created")
  end

  scenario 'Flash error and redirect to employees if not enough active employees' do
    visit standups_path
    click_link 'Add a standup'
    click_button 'Create Standup'
    expect(page).to have_content("Not enough active employees to create standup")
  end

end
