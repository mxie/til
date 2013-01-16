FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :name do |n|
    "Name #{n}"
  end

  factory :user do
    name 'Some Name'
    email
    password "password"
  end

  factory :post

end
