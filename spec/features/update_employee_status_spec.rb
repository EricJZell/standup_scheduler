require 'rails_helper'

feature 'Update an employee status', %{
  As a standup scheduler
  I want to change an employee active status
  To keep an up to date list of who is available for standups

  Acceptance Criteria:
  [x]  I must be able to update an employee status from the employee index
  [x]  I must be able to update from Active to Inactive
  [x]  I must be able to update from Inactive to Active
  [x]  I must remain on the employee index page
} do

  let!(:employee1) { FactoryGirl.create(:employee) }
  let!(:employee2) { FactoryGirl.create(:employee, active: false) }

  scenario 'change employee status from active to inactive' do
    visit employees_path
    click_link 'Make Inactive'
    expect(page).to have_content("#{employee1.name}: (Inactive)")
    expect(page).to have_content("#{employee2.name}: (Inactive)")
  end

  scenario 'change employee status from inactive to active' do
    visit employees_path
    click_link 'Make Active'
    expect(page).to have_content("#{employee1.name}: (Active)")
    expect(page).to have_content("#{employee2.name}: (Active)")
  end

end
