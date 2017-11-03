FactoryBot.define do
  factory :tag do
    sequence(:body) { |n| "#test#{n}" }
  end
end
