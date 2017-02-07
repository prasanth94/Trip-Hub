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

  factory :alice, class: User do
    email "alice.1@gmail.com"
    password "asdasd"
  end

  factory :romeo, class: User do
    email "romeo.1@gmail.com"
    password "asdasd"
  end

  factory :invalid_relation_1, class: Relationship do
    follower_id "3"
  end

  factory :invalid_relation_2, class: Relationship do
    followed_id "3"
  end

end
