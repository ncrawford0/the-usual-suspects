FactoryGirl.define do
  factory :review do
    title "Great Atmosphere"
    body "Me and my partner had a good evening here with some firends.  The food was great!"
    rating 5
    association :bar, factory: :bar
    association :user, factory: :user
  end
end
