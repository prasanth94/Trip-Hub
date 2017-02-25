# Read about factories at https://github.com/thoughtbot/factory_girl
include ActionDispatch::TestProcess
FactoryGirl.define do
	factory :user do
    sequence :email do |n|
      "user#{n}@triphub.org"
    end
    password "asdasd"
    profile_pic { Rack::Test::UploadedFile.new('spec/images/test_img.png', 'image/png') }
  end
end
