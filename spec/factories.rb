FactoryGirl.define do
  factory :trip, class: Trip do
    name "Tawang"
    description  "Zero degree temperature"
  end

  factory :invalid_trip, class: Trip do
    name ""
    description  ""
  end

  factory :invalid_trip_2, class: Trip do
    name "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    description  "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
  end

end
