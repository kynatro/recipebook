require 'rails_helper'

RSpec.describe Ingredient, :type => :model do
  let(:ingredient) { build(:ingredient) }

  subject { ingredient }

  it { is_expected.to respond_to :label }
  it { is_expected.to respond_to :quantities }
  it { is_expected.to respond_to :recipes }

  context "with .label undefined" do
    before { ingredient.label = nil }
    it { is_expected.to_not be_valid }
  end

  context ".label" do
    describe "should strip HTML before_save" do
      let(:label) { "<script>Foo</script>" }
      
      before do
        ingredient.label = label
        ingredient.save
      end

      it { expect(ingredient.label).to eq strip_tags(label) }
    end
  end
end
