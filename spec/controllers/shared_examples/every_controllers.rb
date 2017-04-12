require "rails_helper"

shared_examples "common to all controller actions" do
  it "redirects to the login page if a user is not logged in" do
    sign_out :user

    make_request

    if request.format.to_sym == :json
      expect(response).to be_unauthorized
    else
      expect(response).to redirect_to new_user_session_path
    end
  end
end