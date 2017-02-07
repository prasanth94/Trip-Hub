require 'rails_helper'

RSpec.describe Relationship, type: :model do
  context "invalid Relationship" do
  	it "is invalid without  followed id" do
  	  relation = build(:invalid_relation_2)
  	  expect(relation).not_to be_valid
    end

    it "is invalid without  follower id" do
  	  relation = build(:invalid_relation_1)
  	  expect(relation).not_to be_valid
    end
  end
end
