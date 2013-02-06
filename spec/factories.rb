FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :lesson do |n|
    "lesson ##{n}"
  end

  factory :user do
    email
    password "password"
  end

  factory :post do
    lesson
    user
  end

end
