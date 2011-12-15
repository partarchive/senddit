# Read about factories at http://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :post do
    sequence(:title) { |n| "Title #{n}" }
    sequence(:link) { |n| "http://google.com?q=#{n}" }
    email "testy.testerson@test.com"
  end
end
