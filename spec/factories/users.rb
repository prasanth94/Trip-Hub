# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
	factory :user do
    sequence :email do |n|
      "user#{n}@triphub.org"
    end
    password "asdasd"
  end
end
