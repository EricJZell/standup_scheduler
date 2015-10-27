class Employee < ActiveRecord::Base
  validates :name, presence: true
  has_many :employee_standups, dependent: :destroy
  has_many :standups, through: :employee_standups, dependent: :destroy

  def self.two_active?
    where(active: true).length >= 2
  end
end
