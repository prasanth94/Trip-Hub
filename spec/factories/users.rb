# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :user do
    sequence :email do |n|
      "user#{n}@triphub.org"
    end
    password "asdasd"
    photo { fixture_file_upload(Rails.root.join('spec/fixtures/test_img.png'), 'image/png') }
  end
end
