FactoryBot.define do
  factory :tweet do
    association :user, factory: :user
    sequence(:body) { |n| "testing#{n}" }

    factory :tweet_with_tags do
      transient do
        tags_count 5
      end

      after(:create) do |tweet, evaluator|
        create_list(:tag, evaluator.tags_count, tweets: [tweet])
      end
    end
  end
end
