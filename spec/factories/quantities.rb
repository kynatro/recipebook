FactoryGirl.define do
  factory :quantity do
    recipe
    ingredient
    amount "#{(0..10).to_a.sample} #{['oz', 'cans', 'cups']}"
  end
end
