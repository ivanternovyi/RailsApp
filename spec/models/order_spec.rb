require 'rails_helper'

RSpec.describe Order, :type => :model do

  it "should calculate the total price" do
    item1 = create(:item)
    item2 = create(:item, price: 20)

    order = create(:order)
    order.items << item1
    order.items << item2
    expect(order.calculate_total).to eq(30)
  end

end
