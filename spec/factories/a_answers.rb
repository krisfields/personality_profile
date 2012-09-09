# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :a_answer do
    text "MyString"
    question_id 1
  end
end
