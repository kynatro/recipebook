FactoryGirl.define do
  factory :upload do
    recipe
    image File.new(Rails.root + 'spec/fixtures/images/placeholder.jpg')
  end
end
