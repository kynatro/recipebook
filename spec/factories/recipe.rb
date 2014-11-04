FactoryGirl.define do
  factory :recipe do
    sequence(:title) { |n| "My Recipe #{n}" }
  end
end
