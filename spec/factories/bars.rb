FactoryGirl.define do
  factory :bar do
    sequence(:name) { |n| "Game On#{n}" }
    description "A sports bar by Fenway popular among sox fans."
    street " 82 Lansdowne St"
    city "Boston"
    state "MA"
    zip 02214
    phone "9788086426"
    website "www.google.com"
    association :user, factory: :user
  end
end
