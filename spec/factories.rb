FactoryGirl.define do
  factory :trip, class: Trip do
    id "1"
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

  factory :valid_trip, class: Trip do
    name "Gokarna"
    description "Good vibes"
  end


end
