require 'factory_girl'

FactoryGirl.define do
  factory :user do
    name    'John Doe'
    age     25
    gender  'male'
  end
end
