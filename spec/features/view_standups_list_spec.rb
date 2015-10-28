require 'rails_helper'

feature 'View a list of standups', %{
  As a standup scheduler
  I want to view a list of scheduled standups
  To see who is already on the schedule

  Acceptance Criteria:
  [x]  I must see the date and names assigned to scheduled standups

} do

  scenario 'I navigate to the standups index to view scheduled standups' do
    employee1 = FactoryGirl.create(:employee)
    employee2 = FactoryGirl.create(:employee)
    standup = FactoryGirl.create(:standup)
    EmployeeStandup.create(employee: employee1, standup: standup)
    EmployeeStandup.create(employee: employee2, standup: standup)
    visit standups_path
    expect(page).to have_content(standup.date.strftime("%B %d, %Y"))
    expect(page).to have_content("#{employee1.name}, #{employee2.name}")
  end
end
