FactoryBot.define do
  factory :comment do
    text {Faker::String.random(length: 15)}
    association :post
    association :user
  end
end