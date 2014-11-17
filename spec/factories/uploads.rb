FactoryGirl.define do
  factory :upload do
    recipe
    local_image File.new(Rails.root + 'spec/fixtures/images/placeholder.jpg')
    image File.new(Rails.root + 'spec/fixtures/images/placeholder.jpg')
  end
end
