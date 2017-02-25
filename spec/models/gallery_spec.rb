require 'rails_helper'

RSpec.describe Gallery, type: :model do
  context "image" do
    let(:gallery) { create(:gallery) }
    it "should be valid with profile pic" do
      expect(gallery).to be_valid
    end
  end
end
