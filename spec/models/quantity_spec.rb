require 'rails_helper'

RSpec.describe Quantity, :type => :model do
  let(:quantity) { build(:quantity) }

  subject { quantity }

  it { is_expected.to respond_to :amount }
  it { is_expected.to respond_to :ingredient }
  it { is_expected.to respond_to :recipe }
  it { is_expected.to accept_nested_attributes_for :ingredient }

  context "without .ingredient" do
    before { quantity.ingredient = nil }
    it { is_expected.to_not be_valid }
  end

  context "without .amount" do
    before { quantity.amount = nil }
    it { is_expected.to_not be_valid }
  end

  context ".amount" do
    describe "should strip HTML before_save" do
      let(:amount) { "<script>Foo</script>" }
      
      before do
        quantity.amount = amount
        quantity.save
      end

      it { expect(quantity.amount).to eq strip_tags(amount) }
    end
  end
end
