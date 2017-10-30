FactoryBot.define do
  factory :tweet do
    association :user, factory: :user
    body 'testing'
  end
end
