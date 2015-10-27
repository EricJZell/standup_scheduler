class Standup < ActiveRecord::Base
  validates :date, presence: true
  has_many :employee_standups, dependent: :destroy
  has_many :employees, through: :employee_standups
end
