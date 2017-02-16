require 'rails_helper'

RSpec.describe "Followings", type: :request do
  describe "GET /followings" do
    let(:user) { build(:user, email: "user@gmail.com", id: 1) }
    let(:followed_user) { build(:user, email: "followed_user@gmail.com", id: 2) }
    it "shows the followed user details" do
      user.follow(followed_user)
      login_as(user)
      get following_user_path(user)
      expect(response.body).to include(user.following.count.to_s)
      user.following.each do |followed_user|
      expect(response.body).to include(user_path(followed_user))
      end
    end

    it "shows the following user details" do
      user.follow(followed_user)
      login_as(followed_user)
      get following_user_path(followed_user)
      expect(response.body).to include(followed_user.followers.count.to_s)
      followed_user.following.each do |user|
        expect(response.body).to include(user_path(user))
      end
    end

  end

  describe 'create' do
    let(:user) { build(:user, email: "user@gmail.com") }
    let(:romeo) { FactoryGirl.create(:user, email: "followed_user@gmail.com") }
    context "build a new Relationship" do
      it "creates a new Relationship in the standard way" do
        login_as(user)
        expect {
        post relationships_path params: { followed_id: romeo.id }
        }.to change(user.following, :count).by(1)
      end 
    end
  end

 describe '#destroy' do
    let(:user) { FactoryGirl.create(:user, email: "user@gmail.com") }
    let(:followed_user) { FactoryGirl.create(:user, email: "followed_user@gmail.com") }
    context "delete a  Relationship" do
      it "delete a new Relationship in the standard way" do
        login_as(user)
        user.follow(followed_user)
        relationship = user.active_relationships.find_by(followed_id: followed_user.id)
        expect{
          delete relationship_path(relationship)
        }.to change(user.following, :count).by(-1)
      end
    end
  end

end
