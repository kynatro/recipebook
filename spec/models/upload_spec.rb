require 'rails_helper'

RSpec.describe Upload, :type => :model do
  let(:upload) { build :upload }

  subject { upload }

  it { is_expected.to respond_to :recipe }
  it { is_expected.to respond_to :image }
  it { is_expected.to respond_to :local_image }
  it { is_expected.to have_attached_file :image }
  it { is_expected.to have_attached_file :local_image }
  it { is_expected.to validate_attachment_presence :local_image }
  it { is_expected.to validate_attachment_content_type(:image).allowing("image/png", "image/jpg", "image/gif").rejecting("text/plain", "text/xml") }
  it { is_expected.to validate_attachment_content_type(:local_image).allowing("image/png", "image/jpg", "image/gif").rejecting("text/plain", "text/xml") }
  it { is_expected.to validate_attachment_size(:local_image).less_than 4.megabytes }

  context "without .image" do
    before { upload.local_image = nil }

    it { is_expected.to_not be_valid }
  end

  context "without .recipe" do
    before { upload.recipe = nil }

    it { is_expected.to_not be_valid }
  end
end
