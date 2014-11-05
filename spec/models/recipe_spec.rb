require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  let(:recipe) { build(:recipe) }

  subject { recipe }

  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :instructions }
  it { is_expected.to respond_to :ingredients }
  it { is_expected.to respond_to :quantities }

  context "with .title undefined" do
    before { recipe.title = nil }
    it { is_expected.to_not be_valid }
  end

  context ".title" do
    describe "should strip HTML before_save" do
      let(:title) { "<script>Foo</script>" }
      
      before do
        recipe.title = title
        recipe.save
      end

      it { expect(recipe.title).to eq strip_tags(title) }
    end
  end
end
