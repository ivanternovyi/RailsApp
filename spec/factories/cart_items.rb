FactoryGirl.define do
  factory :cart_item do
    association(:cart)
    association(:item)
    quantity 1
  end
end
