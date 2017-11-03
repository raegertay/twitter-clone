FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@gmail.com" }
    password 'password'
    password_confirmation 'password'
    sequence(:username) { |n| "#test test#{n}" }

    factory :user_with_tweets do
      transient do
        tweets_count 5
      end

      after(:create) do |user, evaluator|
        create_list(:tweet, evaluator.tweets_count, user: user)
      end
    end
  end
end
