require 'rails_helper'

RSpec.describe Trip, type: :model do
  context "invalid trip" do
  	it "is invalid with no name and description" do
  	  trip = build(:invalid_trip)
  	  expect(trip).not_to be_valid
  	end
  	it "is invalid with exceeded length for name and description" do
  	  trip = build(:invalid_trip_2)
  	  expect(trip).not_to be_valid
  	end
  end

end
