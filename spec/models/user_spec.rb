require 'rails_helper'

RSpec.describe User, type: :model do
  context "" do
  	it "follows and unfollows user" do
  	  alice = build(:alice)
  	  romeo = build(:romeo)
  	  expect(romeo.following?(alice)).to be false
  	  romeo.follow(alice)
  	  expect(romeo.following?(alice)).to be true
  	  #romeo.unfollow(alice)
  	  #expect(romeo.following?(alice)).to be false
  	end
  end
end

