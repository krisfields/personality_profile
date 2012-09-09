# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :quiz do
    name "MyString"
    description "MyText"
    user_id 1
    approved false
  end
end
