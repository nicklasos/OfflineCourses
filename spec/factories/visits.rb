# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :visit do
    event_id 1
    user_id 1
    visit false
  end
end
