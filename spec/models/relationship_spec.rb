require 'rails_helper'

RSpec.describe Relationship, type: :model do
  let(:relation1) { build(:relationship, followed_id: "")}
  let(:relation2) { build(:relationship, follower_id: "")}
  context "invalid Relationship" do
  	it "is invalid without  followed id" do
  	  expect(relation1).not_to be_valid
    end

    it "is invalid without  follower id" do
  	  expect(relation2).not_to be_valid
    end
  end
end
