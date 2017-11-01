FactoryBot.define do
  factory :tweet do
    association :user, factory: :user
    sequence(:body) { |n| "testing#{n}" }
  end
end
