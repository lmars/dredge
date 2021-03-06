require 'factory_girl'

FactoryGirl.define do
  factory :user do
    sequence(:name) { |n| "John Doe #{n}" }
  end
end
