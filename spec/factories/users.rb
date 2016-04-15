FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "johndoe#{n}@gmail.com" }
    password "12345678"
  end
end
