FactoryGirl.define do
  factory :recipe do
    sequence(:title) { |n| "My Recipe #{n}" }
    description Faker::Lorem.paragraph
    instructions Faker::Lorem.paragraph
  end
end
