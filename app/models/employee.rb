class Employee < ActiveRecord::Base
  validates :name, presence: true
  validates :active, presence: true
  has_many :employee_standups
  has_many :standups, through: :employee_standups
end
