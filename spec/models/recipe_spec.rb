require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  let(:recipe) { build(:recipe) }

  subject { recipe }

  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :instructions }

  context "with :title undefined" do
    before { recipe.title = nil }
    it { is_expected.to_not be_valid }
  end
end
