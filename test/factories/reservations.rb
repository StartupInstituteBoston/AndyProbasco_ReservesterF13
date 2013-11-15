# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    email "MyString"
    requested_date_and_time "MyString"
    message "MyText"
    restaurant_id 1
  end
end
