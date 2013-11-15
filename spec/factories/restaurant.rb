FactoryGirl.define do
  factory :restaurant do
    name "Test Bistro"
    description "a restaurant"
    address "123 Street"
    phone_number "555-5555"
    #sequence(:name) {|n| "Test Bistro #{n}"}
  end
end
