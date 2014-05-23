# Read about factories at https://github.com/thoughtbot/factory_girl
include BetterLorem

FactoryGirl.define do
  factory :idea do
    association :user
    text        BetterLorem.w(15, true)
  end
end
