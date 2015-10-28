require 'factory_girl'

FactoryGirl.define do
  factory :employee do
    sequence(:name) { |n| "John Smith #{n}" }
    active true
  end

  factory :standup do
    date Date.today
  end
end
