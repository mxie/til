FactoryGirl.define do

  sequence :email do |n|
    "user#{n}@example.com"
  end

  sequence :lesson do |n|
    "lesson ##{n}"
  end

  sequence :tag_list do |n|
    "tag #{n}"
  end

  factory :user do
    email
    password "password"
  end

  factory :post do
    lesson
    user

    factory :tagged_post do
      tag_list
    end
  end

end
