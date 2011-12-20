# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :comment do
    post 
    text "MyText"
    email "moo@moo.com"
  end
end
