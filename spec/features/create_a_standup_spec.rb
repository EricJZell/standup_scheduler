require 'rails_helper'

feature 'Create a standup', %{
  As a standup scheduler
  I want to create a new standup
  So that there are standups scheduled for the coming days

  Acceptance Criteria:
  [x]  Only active employees should be selected for the standup
  [x]  If there are not enough active employees, I receive an error message and
       am brough to the employees path
  [x]  If there are not enough active employees, I am notified at the standups
       index page
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
    visit new_standup_path
    click_button 'Create Standup'
    expect(page).to have_content("Not enough active employees to create standup")
    expect(page).to have_content("Employees:")
  end

  scenario 'I am notified at the standups index if there are not enough active employees' do
    visit standups_path
    expect(page).to have_content("Notice: Not enough active employees to create standup.")
    expect(page).to have_content("Go to employees page")
  end

end
