FactoryGirl.define do
  factory :bar do
    name "Game On"
    description "A sprts bar by fenway popular among sox fans."
    association :user, factory: :user
  end
end
