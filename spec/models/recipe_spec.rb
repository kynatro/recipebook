require 'rails_helper'

RSpec.describe Recipe, :type => :model do
  let(:recipe) { build(:recipe) }

  subject { recipe }

  it { is_expected.to respond_to :title }
  it { is_expected.to respond_to :description }
  it { is_expected.to respond_to :instructions }
  it { is_expected.to respond_to :ingredients }
  it { is_expected.to respond_to :quantities }

  [:title, :description, :instructions].each do |prop|
    context ".#{prop}" do
      context "when undefined" do
        before { recipe.send "#{prop}=", nil }
        it { is_expected.to_not be_valid }
      end

      describe "should strip HTML before_save" do
        let(:prop_value) { "<script>Foo</script>" }
        
        before do
          recipe.send("#{prop}=", prop_value)
          recipe.save
        end

        it { expect(recipe.send("#{prop}")).to eq strip_tags(prop_value) }
      end
    end
  end
end
