FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  factory :user do
    email
    password "password"
  end

  factory :post do
    lesson 'A lesson'
    user
  end

end
