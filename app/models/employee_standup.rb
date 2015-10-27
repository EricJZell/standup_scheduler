class EmployeeStandup < ActiveRecord::Base
  validates :employee_id, presence: true
  validates :standup_id, presence: true
  belongs_to :employee
  belongs_to :standup
end
