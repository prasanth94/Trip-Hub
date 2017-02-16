require 'rails_helper'

RSpec.describe User, type: :model do
  #it { is_expected.to have_db_column(:email) }
  #it { is_expected.to have_db_column(:password).of_type :string }
  #it { is_expected.to have_many(:trips) }

  context "email" do
    let(:user1) { create(:user) }
    let(:user2) { build(:user , email: user1.email) }

    it "does not allow 2 users with same email" do
      expect(user2).to be_invalid
      #expect(user2.errors.messages[:email]).not_to be_empty
    end
  end


  context "following relation" do
  	let(:alice) { build(:user, email: "alice@gmail.com") }
  	let(:romeo) { build(:user, email: "romeo@gmail.com") }

  	it "follows and unfollows user" do
  	  expect(romeo.following?(alice)).to be false
  	  romeo.follow(alice)
  	  expect(romeo.following?(alice)).to be true
  	  #romeo.unfollow(alice)
  	  #expect(romeo.following?(alice)).to be false
  	end
  end
end

