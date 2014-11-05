FactoryGirl.define do
  factory :ingredient do
    label { Faker::Lorem.words(2).join(" ") }
  end
end
