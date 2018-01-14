FactoryGirl.define do
  factory :user do
    sequence(:email){ |i| "email#{i}@gmail.com"}
    password "password"
    admin 0
  end
end
