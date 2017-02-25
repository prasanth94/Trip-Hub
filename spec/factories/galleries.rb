# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess
FactoryGirl.define do
  factory :gallery do
  	association :trip, factory: :trip
    image { Rack::Test::UploadedFile.new('spec/images/test_img.png', 'image/png') }
  end
end
