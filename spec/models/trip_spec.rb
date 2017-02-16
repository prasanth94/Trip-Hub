require 'rails_helper'

RSpec.describe Trip, type: :model do
  #it { is_expected.to have_db_column(:name).of_type :string }
  #it { is_expected.to have_db_column(:description).of_type :string }
  context "invalid trip" do
    let(:trip1) { build(:trip, name: "", description: "")}
    let(:trip2) { build(:trip, name: "manali", description: "#{"a"*555}") }
    let(:trip3) { build(:trip, name: "#{"manali"*30}", description: "#{"a"*55}") }
  	it "is invalid with no name and description" do
  	  expect(trip1).not_to be_valid
  	end
  	it "is invalid with exceeded length for description" do
  	  expect(trip2).not_to be_valid
  	end
    it "is invalid with exceeded length for name" do
      expect(trip3).not_to be_valid
    end
  end

end
