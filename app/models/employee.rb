class Employee < ActiveRecord::Base
  validates :name, presence: true
  validates :active, presence: true
  has_many :employee_standups, dependent: :destroy
  has_many :standups, through: :employee_standups, dependent: :destroy
end
