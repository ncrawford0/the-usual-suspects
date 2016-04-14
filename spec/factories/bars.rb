FactoryGirl.define do
  factory :bar do
    name "Game On"
    description "A sports bar by Fenway popular among sox fans."
    street " 82 Lansdowne St"
    city "Boston"
    state "MA"
    zip 02214
    phone "9788086426"
    association :user, factory: :user
  end
end
